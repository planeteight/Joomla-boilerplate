#!/usr/bin/env bash
set -euo pipefail

echo "[doctor] checking tool availability"

required_tools=(git rg jq node npm python)
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

echo "[doctor] checking assistant files"
for file in CLAUDE.md AGENTS.md .clinerules .devcontainer/devcontainer.json; do
  if [[ ! -f "${file}" ]]; then
    echo "[doctor] missing file: ${file}"
    exit 1
  fi
done

echo "[doctor] PASS"
