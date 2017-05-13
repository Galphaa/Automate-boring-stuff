#!/bin/bash 

apt-get -y update  > /dev/null 2>&1

apt-get -y upgrade > /dev/null 2>&1


# Installing all files needed for first usage.

cat list.txt | xargs apt-get -y install   

apt-get -y update > /dev/null 2>&1

apt-get -y upgrade > /dev/null 2>&1

# Installing repo and then installing pulseaudio-equalizer for more easy control for audio system.

add-apt-repository -y ppa:nilarimogard/webupd8 

apt-get update > /dev/null 2>&1
apt-get install pulseaudio-equalizer

# Putting font forrome and first time it will aske for key enterence just press enter and second time it will not aske for it.

cp SourceCodePro+Powerline+Awesome+Regular.ttf /usr/share/fonts/truetype/

# Making configuration for confuguring vundell .bashrc .vimrc and tmux.config (before evry fonfiguration is needed .")

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp dotfiles/plugins.vim.txt ~/.vim/bundle/plugins.vim

cp dotfiles/vimrc.txt ~/.vimrc
cp dotfiles/tmux.conf.txt ~/.tmux.conf
cp dotfiles/bashrc.txt ~/.bashrc


# Installing Google chrome

apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

clear
cat to_do_list.txt 
