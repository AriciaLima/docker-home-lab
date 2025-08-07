#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Print everything the script is doing
set -x

# ---- CONFIG ----
DOCKER_GROUP=docker

# ---- INSTALL DOCKER ----
echo ">>> Updating system packages..."
sudo apt update

echo ">>> Installing Docker engine..."
sudo apt install -y docker.io

echo ">>> Enabling and starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

# ---- INSTALL DOCKER COMPOSE PLUGIN ----
echo ">>> Installing Docker Compose plugin..."
sudo apt install -y docker-compose-plugin

# ---- ADD USER TO DOCKER GROUP ----
echo ">>> Adding user '$USER' to group '$DOCKER_GROUP'..."
sudo usermod -aG $DOCKER_GROUP $USER

# ---- TEST DOCKER ----
echo ">>> Testing Docker installation..."
docker --version
docker compose version

# ---- DONE ----
echo ""
echo "✅ Setup complete!"
echo "👉 Please log out and log back in OR reboot your machine to apply group changes."
echo "👉 Then you can run: make up"
