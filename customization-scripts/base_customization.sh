#!/bin/bash
#wget https://raw.githubusercontent.com/joeyism/.files/master/.tmux.conf ~/
#wget https://raw.githubusercontent.com/joeyism/.files/master/.vimrc ~/
#wget https://raw.githubusercontent.com/joeyism/.files/master/.bash_aliases ~/
#source ~/.bash_aliases
cd ~
git init
git remote add origin https://github.com/joeyism/.files.git
git pull origin master

mkdir -p ~/.ssh/pw
sudo mkdir -p /etc/openvpn/client/

# .bashrc
cat <<EOT >> ~/.bashrc
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]\[\033[01;33m\]:\[\033[01;34m\]\W\[\033[01;33m\]$(parse_git_branch)\[\033[00m\]$ '
export PROMPT_COMMAND="history -a; history -n"
export EDITOR=vim
EOT

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
