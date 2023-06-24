#! /usr/bin/sh

# Script to start my working session.
# It opens some messaging application and change the windows border color (with Pop_shell)

gsettings set org.gnome.shell.extensions.pop-shell hint-color-rgba 'rgb(72,185,199)'
nohup discord &> /dev/null &
# nohup slack &> /dev/null &
# nohup flatpak run com.slack.Slack &> /dev/null &
nohup thunderbird &> /dev/null &

