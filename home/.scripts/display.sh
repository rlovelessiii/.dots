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
        if [[ xrandr -q | grep " ${width}x1440 " ]]
            CMD="nvidia-settings --assign CurrentMetaMode=\"DP-2: ${width}x1440_120 +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
            break;
        fi
    done

    if [[ $1 == "external" ]]; then
        CMD="${CMD}, DP-4: 2560x1440_120 +2560+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}\""
    else
        CMD="${CMD}\""
    fi

    CMD
fi

