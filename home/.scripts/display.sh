#! /usr/bin/env bash

# Script to switch between external and internal monitors

if [[ $(hostname) == "fox" ]]; then
    if [[ $1 == "external" ]]; then
        xrandr --output HDMI1 --auto --output eDP1 --off
    elif [[ $1 == "internal" ]]; then
        xrandr --output eDP1 --auto --output HDMI1 --off
    fi
elif [[ $(hostname) == "knight" ]]; then
    if [[ $1 == "ultrawide" ]]; then
        OUTPUT="DP-1"
        WIDTH="5120"
        HEIGHT="1440"
        RATE="60"
    elif [[ $1 == "wide" ]]; then
        OUTPUT="DP-1"
        WIDTH="2560"
        HEIGHT="1440"
        RATE="120"
    fi
    if [[ $2 == "external" ]]; then
        xrandr --output DP-2 --mode 2560x1440 --rate 165 --pos ${WIDTH}x0 --rotate right
    fi
    xrandr --output $OUTPUT --mode ${WIDTH}x${HEIGHT} --rate $RATE --pos 0x464
fi

