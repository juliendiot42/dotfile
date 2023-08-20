#! /bin/sh

#ln -s TARGET DIR  # target must exist

# .profile
echo ".profile..."
rm ~/.profile
ln -s "$(pwd)"/profile ~/.profile

# ZSH
echo "ZSH..."
rm ~/.zshrc
ln -s "$(pwd)"/zshrc ~/.zshrc

# neo vim
echo "NeoVim..."
rm ~/.vimrc
rm ~/.vim/vimrc
rm -r ~/.config/nvim
ln -s "$(pwd)"/nvim ~/.config/nvim

# screenLayout
echo "screenlayout..."
rm -r ~/.screenlayout
ln -s "$(pwd)"/screenlayout ~/.screenlayout

# alacritty
echo "alacritty..."
rm -r ~/.config/alacritty
ln -s "$(pwd)"/alacritty ~/.config/alacritty

# conky
echo "conky..."
rm -r ~/.config/conky
ln -s "$(pwd)"/conky ~/.config/conky

# picom
echo "picom..."
rm -r ~/.config/picom
ln -s "$(pwd)"/picom ~/.config/picom

# dunst
echo "dunst..."
rm -r ~/.config/dunst
ln -s "$(pwd)"/dunst ~/.config/dunst

# qtile
echo "qtile..."
rm -r ~/.config/qtile
ln -s "$(pwd)"/qtile ~/.config/qtile

# easystroke (to get mouse button maped to Ctrl key)
echo "easystroke..."
rm -r ~/.easystroke
ln -s "$(pwd)"/easystroke ~/.easystroke

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
ln -s "$(pwd)"/ctags ~/.ctags

# terminator
echo "Terminator..."
rm -r ~/.config/terminator
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

