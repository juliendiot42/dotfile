#!/bin/sh

"$HOME"/.screenlayout/setScreenLayout.sh &
picom &
sleep 3 &


/usr/lib/polkit-kde-authentication-agent-1 &
dunst &
easystroke &
nextcloud &
protonmail-bridge --noninteractive &
sleep 3 && conky &

/usr/bin/ibus-daemon -drxR &
/usr/bin/setxkbmap jd-s
