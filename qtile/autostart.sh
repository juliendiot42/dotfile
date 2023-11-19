#!/bin/sh

picom &
"$HOME"/.screenlayout/setScreenLayout.sh &

sleep 3 &
/usr/lib/polkit-kde-authentication-agent-1 &
nm-applet &
kdeconnect-indicator &

dunst &
easystroke &
nextcloud &
# protonmail-bridge --noninteractive &
protonmail-bridge &
sleep 3 && conky &

/usr/bin/ibus-daemon -drxR &
/usr/bin/setxkbmap jd-s
