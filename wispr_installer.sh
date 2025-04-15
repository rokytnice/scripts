#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status.

sudo apt install  python3-venv

echo "Creating/updating virtual environment..."
python3 -m venv .venv

echo "Activating virtual environment..."
source .venv/bin/activate # Activate for the rest of the script

echo "Installing/updating dependencies..."
pip install --upgrade pip # Good practice
pip install -r requirements_wispr.txt

echo "Running the script..."
python /home/$USER/scripts/wispr.sh

echo "Script wispr installation finished."

