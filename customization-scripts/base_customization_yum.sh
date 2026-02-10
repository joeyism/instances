#!/bin/bash
curl -o /tmp/kitty.terminfo https://raw.githubusercontent.com/kovidgoyal/kitty/master/terminfo/kitty.terminfo
tic -x -o ~/.terminfo /tmp/kitty.terminfo
sudo yum install -y tmux git curl
curl https://raw.githubusercontent.com/joeyism/instances/master/customization-scripts/base_customization.sh | bash
echo "PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '" >> .bashrc
. ~/.bashrc
