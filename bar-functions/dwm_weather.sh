#!/bin/sh

# A dwm_bar function to print the weather from wttr.in
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: curl

. "$DIR/private_config.sh"

dwm_weather() {

    printf "%s" "$SEP1"
    printf "%s" "$(curl -s wttr.in/$LOCATION?format=%l:+%C+%t)"
    printf "%s\n" "$SEP2"
}

dwm_weather
