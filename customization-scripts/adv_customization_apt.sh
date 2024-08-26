#!/bin/bash
curl https://raw.githubusercontent.com/joeyism/instances/master/customization-scripts/base_customization_apt.sh | bash

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
wget https://github.com/neovim/neovim-releases/releases/download/v0.10.1/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
nvim +PackerSync
