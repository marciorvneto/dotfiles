#!/bin/bash

# Create a simlink to .vimrc
ln -rsf .vimrc ~/.vimrc

# Download and install VimPlug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
