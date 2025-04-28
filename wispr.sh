#!/bin/bash

# Activate virtual environment
source .venv/bin/activate

pip list
echo "Running the script..."
./.venv/bin/python ./transcription_listener_offline.py # Use the venv's python explicitly
echo "Script finished."
# Optional: deactivate
deactivate
