echo "docker engine stoppen"
sudo systemctl stop docker.socket
sudo systemctl stop docker
#sudo systemctl status docker
#sudo systemctl stop snap.docker.dockerd

echo "docker engine starten"
sudo systemctl start docker
#sudo systemctl start snap.docker.dockerd
sudo systemctl start docker.socket

sudo systemctl status docker
