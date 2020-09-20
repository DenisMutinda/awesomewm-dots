#!/bin/bash

xmodmap -e "pointer =  3 2 1 4 5 6 7 8 9 10"&
numlockx on &
picom -f --config ~/.config/picom/picom.conf &
feh --bg-scale ~/.config/extras/walls/animelandscape.jpg &

while true;do
#	xsetroot -name "`date` `uptime | sed 's/.*,//'`"
	xsetroot -name "$( date +"%a %F %r" )"
	sleep 1s   # Update time every minute
done &

while true;do
	dwm > /dev/null 2>&1
done
