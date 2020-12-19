#!/bin/bash -x

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WORKING_DIR=`mktemp -d -p /tmp`

function update_upgrade {
apt-get -y -qq update  
apt-get -y -qq upgrade 
}

# Prepearing 
update_upgrade

# Installing Google chrome repository
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'


# Downloading dotfiles
cd $WORKING_DIR 
git clone https://github.com/Galphaa/dotfiles.git
cd $CURRENT_DIR 


# Installing all files needed for first usage.
cat list.txt | xargs apt-get -y -qq install   
update_upgrade

# Putting font forrome and first time it will aske for key enterence just press enter and second time it will not aske for it.
cp .files/SourceCodePro+Powerline+Awesome+Regular.ttf /usr/share/fonts/truetype/

# Making configuration for confuguring vundell .bashrc .vimrc and tmux.config (before evry fonfiguration is needed .")
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp $WORKING_DIR/dotfiles/plugins.vim.txt ~/.vim/bundle/plugins.vim
cp $WORKING_DIR/dotfiles/vimrc.txt ~/.vimrc
cp $WORKING_DIR/dotfiles/tmux.conf.txt ~/.tmux.conf
cp $WORKING_DIR/dotfiles/bashrc.txt ~/.bashrc
cp $WORKING_DIR/dotfiles/config_1 ~/.config/tilda/config_0

update_upgrade
clear

printf "%*s" $(tput cols) | tr " " "="

cat to_do_list.txt 

