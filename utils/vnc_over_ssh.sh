#!/bin/bash
# Start a VNC server via SSH so that VNC is tunnelled in SSH
ssh cisco-devnet@<ip_address> -L 5900:localhost:5900 "/usr/bin/x11vnc -shared -nap -wait 50 -noxdamage -display :0 -forever -o x11vnc.log -bg -geometry 1280x768 -auth guess"

# ssh cisco-devnet@173.36.210.254 -L 5900:localhost:5900 "/usr/bin/x11vnc -shared -nap -wait 50 -noxdamage -display :0 -forever -o x11vnc.log -bg -geometry 1280x768 -auth guess"
