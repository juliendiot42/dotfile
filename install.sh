#! /bin/sh

#ln -s TARGET DIR  # target must exist 

# VIM
echo "Vim..."
rm ~/.vimrc
rm ~/.vim/vimrc
echo "\tlink vimrc"
ln -s "$(pwd)"/vim/vimrc ~/.vim/vimrc
rm -r ~/.vim/UltiSnips
echo "\tlink UltiSnips"
ln -s "$(pwd)"/vim/UltiSnips ~/.vim/UltiSnips
rm -r ~/.vim/after
echo "\tlink after "
ln -s "$(pwd)"/vim/after ~/.vim/after

# ZSH
echo "ZSH..."
rm ~/.zshrc
echo "\tlink zshrc "
ln -s "$(pwd)"/zshrc ~/.zshrc

# CTAGS
echo "CTAGS..."
rm ~/.ctags
echo "\tlink ctags"
ln -s "$(pwd)"/ctags ~/.ctags

# terminator
echo "Terminator..."
rm -r ~/.config/terminator 
echo "\tlink terminator config "
ln -s "$(pwd)"/terminator ~/.config/terminator 
