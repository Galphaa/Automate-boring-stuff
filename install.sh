#!/bin/bash 

apt-get -y update && apt-get -y upgrade 

# Installing all files needed for first usage.

cat list.txt | xargs apt-get -y install   

apt-get -y update && apt-get -y upgrade 


# Installing ATOM.

cd
mkdir .installs
cd .installs
wget https://atom.io/download/deb    
dpkg -i deb
apt-get -y update


# Installing synergy 1.8.8 

wget http://archive.getdeb.net/ubuntu/pool/apps/s/synergy/synergy_1.8.8-1~getdeb1_amd64.deb    
dpkg -i synergy_1.8.8-1~getdeb1_amd64.deb
apt-get -f install -y


# Installing repo and then installing pulseaudio-equalizer for more easy control for audio system.

add-apt-repository -y ppa:nilarimogard/webupd8 
apt-get update
apt-get install pulseaudio-equalizer

# Disable Chrome annoying keyloging after this command once will be requested.

rm ~/.local/share/keyrings/*

# Putting font for zshall 

cp ourceCodePro+Powerline+Awesome+Regular.ttf /usr/share/fonts/truetype/

# Making configuration for confuguring vundell .bashrc .vimrc and tmux.config (before evry fonfiguration is needed .")

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp dotfiles/plugins.vim.txt ~/.vim/bundle/plugins.vim

cp dotfiles/vimrc.txt ~/.vimrc
cp dotfiles/tmux.conf.txt ~/.tmux.conf
cp dotfiles/bashrc.txt ~/.bashrc

# Installing Oh My Zsh

apt-get install zsh

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cd ~/.oh-my-zsh/custom
git clone https://github.com/bhilburn/powerlevel9k.git themes/powerlevel9k
cd - 
cp  dotfiles/zshrc ~/.zshrc

# Installing Fonts
cd ~
git clone https://github.com/powerline/fonts
cd fonts
./install.sh

# cleaning 

cd ~ 
rm -r fonts
