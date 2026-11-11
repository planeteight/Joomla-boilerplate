#!/usr/bin/env bash
set -euo pipefail

echo "[bootstrap] starting"

if [[ -f package.json ]]; then
  echo "[bootstrap] npm project detected"
  if [[ -f package-lock.json ]]; then
    npm ci
  else
    npm install
  fi
fi

if [[ -f requirements.txt ]]; then
  echo "[bootstrap] python requirements detected"
  python -m pip install --upgrade pip
  python -m pip install -r requirements.txt
fi

if [[ -f .pre-commit-config.yaml ]]; then
  echo "[bootstrap] enabling pre-commit"
  python -m pip install pre-commit
  pre-commit install
fi

echo "[bootstrap] done"
