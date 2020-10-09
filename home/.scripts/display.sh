#! /usr/bin/env bash

# Author: Richard Loveless III (rlovelessiii)
# Description: Script to automate display configuration across different machines

if [[ $(hostname) == "fox" ]]; then
    if [[ $1 == "external" ]]; then
        xrandr --output HDMI1 --auto --output eDP1 --off
    else
        xrandr --output eDP1 --auto --output HDMI1 --off
    fi
elif [[ $(hostname) == "knight" ]]; then

    MONITORS_CONNECTED=()
    RESOLUTIONS_SUPPORTED=()
    RATES_SUPPORTED=()
    COMMON_RATES=()
    HORIZONTAL_OFFSET=( 0 )
    VERTICAL_OFFSET=( 0 0 )

    MONITOR_DATA=( $(xrandr -q | grep -A 1 " connected ") )
    
    for data in ${MONITOR_DATA[@]}; do
        if [[ $data == "connected" ]]; then
            MONITORS_CONNECTED+=( ${PREV_DATA} )
        elif [[ $data == ????x???? ]]; then
            RESOLUTIONS_SUPPORTED+=( ${data} )
        elif [[ $data =~ ^[0-9]{2,3}[\.] ]]; then
            RATES_SUPPORTED+=( ${data} )
        else
            PREV_DATA=${data}
        fi
    done

    declare -A RATE
    
    for rate in ${RATES_SUPPORTED[@]}; do
        HZ=$(echo ${rate} | cut -d \* -f 1)
        HZ=$(printf "%.0f\n" ${HZ})
        RATE[${HZ}]=$((RATE[${HZ}]+1))
        if [[ RATE[${HZ}] -gt 1 ]]; then
            COMMON_RATES+=( ${HZ} )
        fi
    done

    HIGHEST_RATE=0
    
    for rate in ${COMMON_RATES[@]}; do
        if [[ ${rate} -gt ${HIGHEST_RATE} ]]; then
            HIGHEST_RATE=${rate}
        fi
    done

    HORIZONTAL_OFFSET+=( $(echo ${RESOLUTIONS_SUPPORTED[0]} | cut -d x -f 1) )

    for (( i=0; i<${#MONITORS_CONNECTED[@]}; i++ )); do
        META="${META} ${MONITORS_CONNECTED[i]}: ${RESOLUTIONS_SUPPORTED[i]}_${HIGHEST_RATE} +${HORIZONTAL_OFFSET[i]}+${VERTICAL_OFFSET[i]} {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On},"
    done

    nvidia-settings --assign CurrentMetaMode="${META}"

fi

