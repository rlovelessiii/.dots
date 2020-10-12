#!/usr/bin/env bash
# ~/.dots/dotlink.sh
# author: RLovelessIII
# description: Designed to create Symbolic Links for Unix '.' configuration files

DIR_NAME=$(dirname "$0")
MKPATH_S=${DIR_NAME}/home/.scripts/mkpath.sh
LINK_S=${DIR_NAME}/home/.scripts/link.sh

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
    echo "Installing Bash-It..."
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
        ~/.bash_it/install.sh --no-modify-config && \
        echo "Done! Bash-It Installed"
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

function finalize {
    wal -a 70 -i /usr/share/backgrounds/i3_default_background.jpg
}

if [[ $(uname) == "Linux" ]]; then
    create_dirs && \
    install_bash_it && \
    install_packages && \
    ${LINK_S} ${DIR_NAME}/home ${HOME} && \
    sudo ${LINK_S} ${DIR_NAME}/etc / && \
    finalize && \
    reboot
elif [[ $(uname) == "Darwin" ]]; then
    echo "TODO"
fi
