#!/usr/bin/env bash
# ~/.dots/dotlink.sh
# author: RLovelessIII
# description: Designed to create Symbolic Links for Unix '.' configuration files

function create_dirs {
    while read -r line; do
        DIR=$(echo ${line} | cut -d \# -f 1)
        if [[ ${DIR} ]]; then
            DIRS+=( ${DIR} )
        fi
    done < "$(dirname "$0")/dir-list.txt"
    for DIR in "${DIRS[@]}"; do
        $(dirname "$0")/home/.scripts/mkpath.sh $DIR
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
    done < "$(dirname "$0")/package-list.txt"
    yay -Syyu ${PACKAGE_LIST}
}

function finalize {
    wal -a 70 -i /usr/share/backgrounds/i3_default_background.jpg
}

if [[ $(uname) == "Linux" ]]; then
    create_dirs && \
    install_bash_it && \
    install_packages && \
    $(dirname "$0")/home/.scripts/link.sh $(dirname "$0")/home ${HOME} && \
    finalize && \
    reboot
elif [[ $(uname) == "Darwin" ]]; then
    echo "TODO"
fi
