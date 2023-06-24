#! /bin/sh

#ln -s TARGET DIR  # target must exist 













# ZSH
echo "ZSH..."
rm ~/.zshrc
echo "\tlink zshrc "
ln -s "$(pwd)"/zshrc ~/.zshrc

# neo vim
echo "NeoVim..."
rm ~/.vimrc
rm ~/.vim/vimrc
rm -r ~/.config/nvim
ln -s "$(pwd)"/nvim ~/.config/nvim

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
