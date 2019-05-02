#!usr/bin/env bash
local _VUNDLE_HOME="$HOME/.vim/bundle/Vundle.vim"

# Install Vundle
if [[ ! -e $_VUNDLE_HOME ]]; then
    echo "install Vundle."
    git clone https://github.com/VundleVim/Vundle.vim.git $_VUNDLE_HOME
fi