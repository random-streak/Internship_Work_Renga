#!/usr/bin/env bash
set -euo pipefail

# Simple helper to create a venv, install requirements, and run Jupyter Lab
# Usage: `bash scripts/setup_and_run.sh` from the repository root

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PYTHON=${PYTHON:-python3}
VENV_DIR="${REPO_ROOT}/.venv"

echo "Repository root: $REPO_ROOT"

if ! command -v "$PYTHON" >/dev/null 2>&1; then
  echo "Error: $PYTHON not found. Install Python 3.8+ or set PYTHON env var." >&2
  exit 1
fi

if [ ! -d "$VENV_DIR" ]; then
  echo "Creating virtual environment at $VENV_DIR..."
  "$PYTHON" -m venv "$VENV_DIR"
fi

echo "Activating virtual environment and installing requirements..."
# shellcheck source=/dev/null
source "$VENV_DIR/bin/activate"
pip install --upgrade pip
if [ -f "$REPO_ROOT/requirements.txt" ]; then
  pip install -r "$REPO_ROOT/requirements.txt"
else
  echo "Warning: requirements.txt not found — skipping pip install"
fi

echo "Launching Jupyter Lab (Ctrl-C to exit)..."
jupyter lab
