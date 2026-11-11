#!/usr/bin/env bash
set -euo pipefail

echo "[doctor] checking tool availability"

required_tools=(git rg jq node npm python php composer)
missing=0

for tool in "${required_tools[@]}"; do
  if ! command -v "${tool}" >/dev/null 2>&1; then
    echo "[doctor] missing: ${tool}"
    missing=1
  fi
done

if command -v fd >/dev/null 2>&1; then
  FD_BIN="fd"
elif command -v fdfind >/dev/null 2>&1; then
  FD_BIN="fdfind"
else
  echo "[doctor] missing: fd (or fdfind)"
  missing=1
fi

if [[ ${missing} -eq 1 ]]; then
  echo "[doctor] FAIL: install missing tools"
  exit 1
fi

echo "[doctor] versions"
git --version
rg --version | head -n 1
"${FD_BIN}" --version
jq --version
node --version
npm --version
python --version
php --version | head -n 1
composer --version

if ! php -r 'exit(version_compare(PHP_VERSION, "8.4.0", ">=") ? 0 : 1);'; then
  echo "[doctor] PHP 8.4 or newer is required for Joomla 6 development"
  exit 1
fi

required_php_extensions=(curl gd intl mbstring mysqli pdo_mysql zip)
for extension in "${required_php_extensions[@]}"; do
  if ! php -r "exit(extension_loaded(\$argv[1]) ? 0 : 1);" "${extension}"; then
    echo "[doctor] missing PHP extension: ${extension}"
    missing=1
  fi
done

if [[ ${missing} -eq 1 ]]; then
  echo "[doctor] FAIL: install missing tools or PHP extensions"
  exit 1
fi

echo "[doctor] checking assistant files"
for file in CLAUDE.md AGENTS.md .clinerules .devcontainer/devcontainer.json; do
  if [[ ! -f "${file}" ]]; then
    echo "[doctor] missing file: ${file}"
    exit 1
  fi
done

echo "[doctor] PASS"
