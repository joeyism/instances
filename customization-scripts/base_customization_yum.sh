#!/bin/bash

# kitty
curl -o /tmp/kitty.terminfo https://raw.githubusercontent.com/kovidgoyal/kitty/master/terminfo/kitty.terminfo
tic -x -o ~/.terminfo /tmp/kitty.terminfo

# apps
sudo dnf install -y tmux git docker

# docker
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker $USER
sudo systemctl start docker
sudo systemctl enable docker
newgrp docker

# me
curl https://raw.githubusercontent.com/joeyism/instances/master/customization-scripts/base_customization.sh | bash
echo "PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '" >> .bashrc
. ~/.bashrc
