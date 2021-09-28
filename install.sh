#! /bin/sh

#ln -s TARGET DIR  # target must exist 

# VIM
rm ~/.vimrc
rm ~/.vim/vimrc
ln -s "$(pwd)"/vim/vimrc ~/.vim/vimrc
rm -r ~/.vim/UltiSnips
ln -s "$(pwd)"/vim/UltiSnips ~/.vim/UltiSnips
rm -r ~/.vim/after
ln -s "$(pwd)"/vim/after ~/.vim/after

# ZSH
rm ~/.zshrc
ln -s "$(pwd)"/zshrc ~/.zshrc

# CTAGS
rm ~/.ctags
ln -s "$(pwd)"/ctags ~/.ctags

# terminator
rm -r ~/.config/terminator 
ln -s "$(pwd)"/terminator ~/.config/terminator 