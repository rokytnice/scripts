#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.

sudo apt install  python3-venv
sudo apt-get update && 
sudo apt-get install build-essential
sudo apt-get install -y portaudio19-dev
sudo apt-get install -y python3.12-dev
sudo apt-get install -y pkg-config
sudo apt-get install -y libasound2-dev

echo "Creating/updating virtual environment..."


python3 -m venv .venv
source .venv/bin/activate

echo "Installing/updating dependencies..."
pip install --upgrade pip # Good practice

./.venv/bin/pip install -r requirements_wispr.txt

echo "Installing/updating dependencies..."

# Install numpy first (hopefully using a faster wheel)
echo "Installing numpy..."
pip install numpy==2.0.0


echo "Running the script..."
python /home/$USER/scripts/wispr.sh

pip list

echo "Wispr installation finished."
