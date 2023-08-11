#! /bin/sh

#ln -s TARGET DIR  # target must exist

# .profile
echo ".profile..."
rm ~/.profile
echo "\tlink profile "
ln -s "$(pwd)"/profile ~/.profile

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

# qtile
echo "qtile..."
rm -r ~/.config/qtile
ln -s "$(pwd)"/qtile ~/.config/qtile

# R-studio
echo "Rstudio..."
rm -r ~/.config/rstudio
ln -s "$(pwd)"/rstudio ~/.config/rstudio

# R profile
echo "R profile/Renvironment..."
rm ~/.Rprofile
ln -s "$(pwd)"/Rprofile ~/.Rprofile
rm ~/.Renviron
ln -s "$(pwd)"/Renviron ~/.Renviron

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


# utils scripts
for scriptFile in $(ls utils_scripts)
do
    echo "$scriptFile"
    chmod +x utils_scripts/$scriptFile
done

# applications
echo "Applications..."
for appfile in $(ls applications/*.desktop)
do
    echo "$appfile"
    rm -r ~/.local/share/$appfile
    ln -s "$(pwd)"/$appfile ~/.local/share/$appfile
done

