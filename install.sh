#!/bin/sh

# Updates
sudo apt update
sudo apt upgrade -y

# Normal apps
sudo apt install wget curl git gedit* vim nano tmux w3m htop filezilla terminator python3 python3-pip python3-virtualenv zathura sxiv pandoc tree mlocate lm-sensors code libreoffice -y

# Vim Config
echo "syntax enable
set rnu nu
set ts=4
set expandtab
set shiftwidth=4
set cursorline
set showmatch
let python_highlight_all = 1
nnoremap ç <Esc>
vnoremap ç <Esc>
inoremap ç <Esc>
" > ~/.vimrc

# .bash_aliases
echo 'alias ..="cd .."' >> ~/.bashrc
echo 'alias lt="ls -alt"' >> ~/.bashrc

# Finishing tasks
sudo apt update
sudo apt upgrade -y
sudo updatedb
sudo reboot
