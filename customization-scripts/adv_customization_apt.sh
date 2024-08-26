#!/bin/bash
curl https://raw.githubusercontent.com/joeyism/instances/master/customization-scripts/base_customization_apt.sh | bash

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim python3-neovim
nvim +PackerSync
