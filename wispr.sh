#!/bin/bash
#set -e # Exit immediately if a command exits with a non-zero status.

#echo "Creating/updating virtual environment..."
#python3 -m venv .venv

#echo "Activating virtual environment..."
#source .venv/bin/activate # Activate for the rest of the script

#echo "Installing/updating dependencies..."
#pip install --upgrade pip # Good practice
#pip install -r requirements.txt

echo "Running the script..."
python /home/andre/scripts/transcription_listener_offline.py # Use the venv's python explicitly

echo "Script finished."
# Optional: deactivate
