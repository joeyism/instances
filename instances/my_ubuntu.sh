# dependencies
sudo apt install -y vim vim-gtk tmux htop i3 rxvt-unicode git cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2 xclip

# config files
curl https://raw.githubusercontent.com/joeyism/instances/master/scripts/customization-scripts/base_customization_apt.sh | bash
wget https://raw.githubusercontent.com/joeyism/.files/master/.Xresources
git clone https://github.com/joeyism/.files.git
mv .files/.config/* .config/
rm -rf .files

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

# terminal
sudo update-alternatives --config x-terminal-emulator
