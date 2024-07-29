#!/bin/bash

# Update and upgrade the package list
sudo apt-get update -y
sudo apt-get upgrade -y

# Install Docker
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce

# Add the current user to the docker group
sudo usermod -aG docker $USER

# Install Docker Compose
DOCKER_COMPOSE_VERSION="2.29.1"
sudo curl -L "https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install nvm (Node Version Manager)
NVM_VERSION="v0.39.5"
NODE_VERSION="v20.16.0"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh | bash
source ~/.bashrc
nvm install $NODE_VERSION

# Install Python pip venv
sudo apt-get install -y python3 python3-pip python3-venv

# Install nest, angular and typescript

npm install -g @nestjs/cli @angular/cli typescript

# Verify installations
echo "Verifying installations..."
docker --version
docker-compose --version
node -v
npm -v
python3 --version
pip3 --version

echo "Setup completed!"
