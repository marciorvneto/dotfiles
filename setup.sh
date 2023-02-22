#!/bin/bash

# Create a simlink to .vimrc
ln -rsf .vimrc ~/.vimrc
#
# Create a simlink to .vimrc
ln -rsf nvim ~/.config/nvim

# Download and install VimPlug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
