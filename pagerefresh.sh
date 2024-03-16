#!/bin/bash
sleep 10

# Allow root user to access X server
host si:localuser:root

# Run the script with sudo
sudo -E -u root bash <<EOF
export DISPLAY=:0

# Infinite loop to refresh the page every 100 seconds
export DISPLAY=:0
for ((counter = 1; counter <= 1210; counter++)) #When this reaches 1210, ~7 days will complete and the device will reboot to go through the script again
do
    xdotool key F5
    sleep 500             # Page will refresh every 500 seconds
done

#Script is now out of the loop meaning that 24 hours have elapsed and will go through a reboot to check for updates
sudo reboot

EOF

# Revoke permission for root to access X server
xhost -si:localuser:root
