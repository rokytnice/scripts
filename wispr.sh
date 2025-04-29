#!/bin/bash

# Ermittle das Verzeichnis, in dem das Script liegt
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "$SCRIPT_DIR"
cd "$SCRIPT_DIR"

# Aktiviere das virtuelle Environment
if [ ! -d ".venv" ]; then
  echo "Virtual environment not found! Creating one..."
  python3 -m venv .venv
fi

source .venv/bin/activate

pip list
echo "Running the script..."
python $SCRIPT_DIR/transcription_listener_offline.py
echo "Script finished."

# Optional: deactivate (nicht zwingend notwendig in Scripts)
deactivate 2>/dev/null || true
