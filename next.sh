#!/bin/sh
onLogout() {
    ~/Library/LaunchAgents/Bluet-Auth/blueutil
    exit
}

trap 'onLogout' SIGTERM 
trap 'onLogout' SIGHUP  
trap 'onLogout' SIGINT 
trap 'onLogout' SIGKILL 

~/Library/LaunchAgents/Bluet-Auth/blueutil

tail -f /dev/null &
wait $!
