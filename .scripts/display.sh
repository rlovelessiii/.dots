#! /usr/bin/env bash

# Script to switch between external and internal monitors

if [[ $1 == "external" ]]; then
    xrandr --output HDMI1 --auto --output eDP1 --off
elif [[ $1 == "internal" ]]; then
    xrandr --output eDP1 --auto --output HDMI1 --off
fi

