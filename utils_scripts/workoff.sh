#! /usr/bin/sh

# Script to stop my working session
# It closes messaging applications
# change the windows border color (with Pop_shell)
# sync my Documents folder on my backup storage (with rsync)


pkill -9 Discord
pkill -9 slack
pkill -9 thunderbird
# gsettings set org.gnome.shell.extensions.pop-shell hint-color-rgba 'rgb(72, 105, 48)'
bash ~/Documents/AutoSyncMyDocuments/upload_mydoc.sh
echo DONE
sleep 3

