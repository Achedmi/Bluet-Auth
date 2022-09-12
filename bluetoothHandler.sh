#!/bin/sh

onLogout() {
    for address in $($(dirname ${BASH_SOURCE[0]})/blueutil --paired | awk '{print $2}' | cut -d "," -f 1)
    do
        $(dirname ${BASH_SOURCE[0]})/blueutil --unpair "$address"
    done
    exit
}

trap 'onLogout' SIGINT SIGHUP SIGTERM SIGKILL 

while true; do
    sleep 86400 &
    wait $!
done
