#! /bin/sh

#ln -s TARGET DIR  # target must exist 
rm ~/.vimrc
ln -s "$(pwd)"/.vimrc ~/.vimrc
rm ~/.zshrc
ln -s "$(pwd)"/.zshrc ~/.zshrc
