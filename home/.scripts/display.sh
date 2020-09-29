#! /usr/bin/env bash

# Script to switch between external and internal monitors

if [[ $(hostname) == "fox" ]]; then
    if [[ $1 == "external" ]]; then
        xrandr --output HDMI1 --auto --output eDP1 --off
    elif [[ $1 == "internal" ]]; then
        xrandr --output eDP1 --auto --output HDMI1 --off
    fi
elif [[ $(hostname) == "knight" ]]; then
    if [[ $1 == "32:9" ]]; then
        WIDTH="5120"
        RATE="60"
    elif [[ $1 == "21:9" ]]; then
        WIDTH="3360"
        RATE="120"
    elif [[ $1 == "16:9" ]]; then
        WIDTH="2560"
        RATE="120"
    elif [[ $1 == "11:9" ]]; then
        WIDTH="1760"
        RATE="120"
    fi

    CMD1="xrandr --output DP-1 --mode ${WIDTH}x1440 --rate $RATE --pos 0x464"

    if [[ $2 == "external" ]]; then
        CMD2="xrandr --output DP-2 --mode 2560x1440 --rate 165 --pos ${WIDTH}x0 --rotate right"
    else
        CMD2="xrandr --output DP-2 --off"
    fi

    $CMD1 && $CMD2
fi

