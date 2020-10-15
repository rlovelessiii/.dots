#!/usr/bin/env bash

# Author: Richard Loveless III (rlovelessiii)
# Description: Setup functions for fresh Manjaro-i3 install

DIR_NAME=$(dirname "$0")
LINK_S=${DIR_NAME}/update_links.sh
MKPATH_S=${DIR_NAME}/home/.scripts/mkpath.sh

WINDOW_TRANSPARENCY=70
WALLPAPER="/usr/share/backgrounds/i3_default_backgrounds.jpg"

function create_dirs {
    while read -r line; do
        DIR=$(echo ${line} | cut -d \# -f 1)
        if [[ ${DIR} ]]; then
            DIRS+=( ${DIR} )
        fi
    done < "$(dirname "$0")/dir-list.txt"
    for DIR in "${DIRS[@]}"; do
        PARENT=$( echo ${DIR} | cut -d / -f 1 )
        DIR=$( echo ${DIR} | cut -d / -f 2- )
        if [[ ${PARENT} == "\$HOME" ]]; then
            DIR="${HOME}/${DIR}"
            ${MKPATH_S} ${DIR}
        elif [[ ${PARENT} == "\$ROOT" ]]; then
            DIR="/${DIR}"
            sudo ${MKPATH_S} ${DIR}
        fi
    done
    unset DIRS
}

function install_bash_it {
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh --no-modify-config
}

function install_packages {
    while read -r line; do
        PACKAGE=$(echo ${line} | cut -d \# -f 1)
        if [[ ${PACKAGE} ]]; then
            PACKAGE_LIST+=" ${PACKAGE}"
        fi
    done < "${DIR_NAME}/package-list.txt"
    yay -Syyu ${PACKAGE_LIST}
}

function link_dots {
    ${LINK_S}
}

function finalize {
    wal -a ${WINDOW_TRANSPARENCY} -i ${WALLPAPER}
}

