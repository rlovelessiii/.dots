#! /usr/bin/env bash

# Script to switch between external and internal monitors

if [[ $(hostname) == "fox" ]]; then
    if [[ $1 == "external" ]]; then
        xrandr --output HDMI1 --auto --output eDP1 --off
    else
        xrandr --output eDP1 --auto --output HDMI1 --off
    fi
elif [[ $(hostname) == "knight" ]]; then
    WIDTH=('5120' '3360' '2560' '1760')

    CMD1=()
    CMD2=() 

    for w in ${WIDTH[@]}; do
        CMD1+=( 'xrandr --output DP-1 --mode ${w}x1440 --pos 0x464' )
        if [[ $1 == "external" ]]; then
            CMD2+=( 'xrandr --output DP-2 --mode 2560x1440 --pos ${w}x0 --rotate right' )
        else
            CMD2='xrandr --output DP-2 --off'
        fi
    done
fi

