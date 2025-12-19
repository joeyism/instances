# dependencies
sudo apt update
sudo app upgrade
sudo apt install -y vim fzf git conky-all rofi tmux htop i3 rxvt-unicode git cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2 xclip

# config files
curl https://raw.githubusercontent.com/joeyism/instances/master/customization-scripts/base_customization.sh | bash

# vivaldi
wget -qO- http://repo.vivaldi.com/stable/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository "deb [arch=i386,amd64] http://repo.vivaldi.com/stable/deb/ stable main"
sudo apt install -y vivaldi-stable

# polybar
sudo apt install -y polybar

# kitty
sudo apt install -y kitty
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/kitty 50

# terminal
#sudo update-alternatives --config x-terminal-emulator

# font
sudo apt install -y fonts-font-awesome

# python
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update

# misc
sudo apt install -y arandr polybar light

# plymouth themes
git clone https://github.com/adi1090x/plymouth-themes.git
sudo cp -r plymouth-themes/pack_2/cybernetic/ /usr/share/plymouth/themes/
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/cybernetic/cybernetic.plymouth 100
sudo update-initramfs -u

curl 'https://avatars.githubusercontent.com/u/7503144?s=100&u=fc030f4c02c0a75617a72259f3b0f7d473aec04e&v=4' > logo.png
sudo mv logo.png /usr/share/plymouth/ubuntu-logo.png

# set darkmode
gsettings set org.gnome.shell.ubuntu color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme Yaru-dark # Legacy apps, can specify an accent such as Yaru-olive-dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark # new apps
gsettings reset org.gnome.shell.ubuntu color-scheme

# global gitignore
echo "*.swp" > ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# docker
curl -fsSL https://get.docker.com | sudo sh
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chown $USER:$USER /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# aws cli v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# neovim
curl -fsSL https://raw.githubusercontent.com/MordechaiHadad/bob/master/scripts/install.sh | bash
bob install stable
bob use stable | yes
