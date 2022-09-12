#!/bin/sh

count=$(ps | grep "sleep 86400" | grep -v grep | wc -l)

if [ $count -lt 1 ]; then
    onLogout() {
        for address in $($(dirname ${BASH_SOURCE[0]})/blueutil --paired | awk '{print $2}' | cut -d "," -f 1)
        do
        $(dirname ${BASH_SOURCE[0]})/blueutil --unpair "$address"
        done
        exit
    }
    trap 'onLogout' SIGINT SIGHUP SIGTERM SIGKILL
    while true; do
        sleep 86400
    done
fi
clear
