#!/bin/bash
exec /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
exec light-locker &
exec picom -b &
exec nitrogen --restore &
exec parcellite &
exec nm-applet &
