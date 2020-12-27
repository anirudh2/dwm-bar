#!/bin/sh

# A dwm_bar function to show the current network speeds
# anirudh2
# GNU GPLv3

. "$DIR/private_config.sh"

dwm_network () {
    rx0="$(cat /sys/class/net/$(echo $DEVICE)/statistics/rx_bytes)"
    tx0="$(cat /sys/class/net/$(echo $DEVICE)/statistics/tx_bytes)"
    sleep 1s
    rxf="$(cat /sys/class/net/$(echo $DEVICE)/statistics/rx_bytes)"
    txf="$(cat /sys/class/net/$(echo $DEVICE)/statistics/tx_bytes)"

    # Calculations
    rps=`expr $rxf - $rx0`
    tps=`expr $txf - $tx0`
    rmps=`expr $rps / 1000`
    tmps=`expr $tps / 1000`

    printf "%s" "$SEP1"

    if [ "$IDENTIFIER" = "unicode" ]; then
        printf " %s  %s" "$rmps" "$tmps"
    else
        printf "DOWN %s UP %s" "$rmps" "$tmps"
    fi
    printf "%s\n" "$SEP2"
}

dwm_network
