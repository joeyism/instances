# dependencies
sudo apt update
sudo app upgrade
sudo apt install -y vim vim-gtk tmux htop i3 rxvt-unicode git cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2 xclip

# config files
curl https://raw.githubusercontent.com/joeyism/instances/master/customization-scripts/base_customization.sh | bash
rm .tmux.conf
mv .tmux29.conf .tmux.conf

# vivaldi
wget -qO- http://repo.vivaldi.com/stable/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository "deb [arch=i386,amd64] http://repo.vivaldi.com/stable/deb/ stable main"
sudo apt install vivaldi-stable

# polybar
git clone https://github.com/jaagr/polybar.git
cd polybar && ./build.sh

# kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator ~/.local/bin/kitty 50

# terminal
sudo update-alternatives --config x-terminal-emulator

# font
sudo apt install -y fonts-font-awesome

# python
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install -y python3.8 python3.8-dev python3.8-venv python3.8-distutils python3.8-lib2to3 python3.8-gdbm python3.8-tk 

# misc
sudo apt install -y arandr polybar light
