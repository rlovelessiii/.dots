#! /usr/bin/env bash

# Script to switch between external and internal monitors

if [[ $(hostname) == "fox" ]]; then
    if [[ $1 == "external" ]]; then
        xrandr --output HDMI1 --auto --output eDP1 --off
    else
        xrandr --output eDP1 --auto --output HDMI1 --off
    fi
elif [[ $(hostname) == "knight" ]]; then
    WIDTHS=('5120' '3360' '2560' '1760')

    for width in ${WIDTHS[@]}; do
        CMD="xrandr --output DP-1 --mode ${width}x1440 --pos 0x464"
        if [[ $1 == "external" ]]; then
            $CMD && xrandr --output DP-2 --mode 2560x1440 --pos ${width}x0 --rotate right
        else
            $CMD && xrandr --output DP-2 --off
        fi
    done
fi

