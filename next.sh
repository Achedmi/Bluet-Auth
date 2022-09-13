#!/bin/sh
onLogout() {
    ~/Library/LaunchAgents/BluetoothHandler/blueutil
    exit
}

trap 'onLogout' SIGTERM SIGHUP SIGINT SIGKILL 

while true; do
    sleep 86400 &
    wait $!
done
