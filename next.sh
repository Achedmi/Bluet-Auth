#!/bin/sh
onLogout() {
    ~/Library/LaunchAgents/BluetoothHandler/blueutil
    exit
}

trap 'onLogout' SIGTERM 
trap 'onLogout' SIGHUP  
trap 'onLogout' SIGINT 
trap 'onLogout' SIGKILL 

tail -f /dev/null &
wait $!