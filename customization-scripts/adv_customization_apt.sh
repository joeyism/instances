#!/bin/bash
curl https://raw.githubusercontent.com/joeyism/instances/master/customization-scripts/base_customization_apt.sh | bash
sudo apt install fzf

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
wget https://github.com/neovim/neovim-releases/releases/download/v0.10.1/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
nvim +PackerSync

# docker
curl https://get.docker.com/ | bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# docker compose
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.29.6/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
echo 'PATH="$PATH:$HOME/.docker/cli-plugins"' >> ~/.bashrc
