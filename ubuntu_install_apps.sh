#!/bin/bash

#!/bin/bash

# --- Existing update/upgrade ---
sudo apt update
sudo apt upgrade -y # Add -y for non-interactive upgrades

########################################################## docker ######################################################

# Notwendige Pakete installieren
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Offiziellen GPG-Schlüssel von Docker hinzufügen
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://get.docker.com -o get-docker.sh
 sudo sh ./get-docker.sh --dry-run
newgrp docker
sudo usermod -aG docker $USER
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
########################################################## python ######################################################

# --- Install core packages ---
sudo apt install -y python3 snapd trash-cli timeshift libfuse2 docker.io google-chrome-stable
# --- Add user to docker group (Requires logout/login after script runs!) ---
echo "IMPORTANT: You need to log out and log back in for Docker permissions to take effect."

# --- Install snaps ---
sudo snap install pycharm-professional --classic
sudo snap install intellij-idea-ultimate --classic
# Note: intellij-professional might be a typo, usually it's ultimate or community
# sudo snap install intellij-professional --classic

# --- Create directories ---
mkdir -p ~/projects # Use -p to avoid errors if they exist
mkdir -p ~/apps

# --- Codeium / Windsurf Install ---
# Ensure Downloads directory exists
mkdir -p ~/Downloads
cd ~/Downloads || exit # Exit if cd fails

# Add Codeium repo and key (Assuming key management is handled elsewhere or implicitly by apt)
# The original script had a specific key path, ensure that key exists or adjust apt setup
# Example using default apt key management if possible:
# wget -qO - https://<codeium_key_url> | sudo apt-key add - # Replace with actual key URL/method
# echo "deb [arch=amd64] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list > /dev/null

# The provided snippet uses a specific signed-by method, ensure the key exists:
# Assuming /usr/share/keyrings/windsurf-stable-archive-keyring.gpg exists
echo "deb [signed-by=/usr/share/keyrings/windsurf-stable-archive-keyring.gpg arch=amd64] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list > /dev/null

sudo apt-get update
# Consider installing instead of upgrading if it's a fresh setup
sudo apt-get install -y windsurf # Or upgrade if preferred: sudo apt-get upgrade -y windsurf

echo "Script finished. Remember to log out and log back in for Docker group changes."

cd ~ # Return to home directory
