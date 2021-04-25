#!/bin/bash
exec /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
exec picom -b &
exec nitrogen --restore &
