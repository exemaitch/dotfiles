#!/usr/bin/env bash


if [ ! -d ~/.vim/autoload ]; then
	mkdir -p ~/.vim/autoload
fi 

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ 
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

