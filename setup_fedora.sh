#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)
# Description: Setup functions for fresh Fedora Workstation install

DIR_NAME=$(dirname "$0")
LINK_SCRIPT=${DIR_NAME}/update_links.sh

function create_directories {

        while read -r line; do
            DIR=$(echo ${line} | cut -d \# -f 1)
            if [[ ${DIR} ]]; then
                DIRS+=( ${DIR} )
            fi
        done < "${DIR_NAME}/dir-list"

        for DIR "${DIRS[@]}"; do
            PARENT=$(echo ${DIR} | cut -d / -f 1 )
            CHILD=$( echo ${DIR} | cut -d / -f 2- )
            if [[ ${PARENT} == "\$HOME" ]]; then
                mkdir -p "${HOME}/${CHILD}"
            elif [[ ${PARENT} == "\$ROOT" ]]; then
                mkdir -p "/${CHILD}"
            fi
        done
        unset DIRS
}

function install_bash_it {
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh --no-modify-config
}

function install_sdkman {
    curl -s "https://get.sdkman.io" | bash
}

function install_nvm {
	git clone https://github.com/nvm-sh/nvm.git ~/.nvm_sh
	~/.nvm_sh/install.sh
}

function install_packages {
    while read -r line; do
        PACKAGE=$(echo ${line} | cut -d \# -f 1)
        if [[ ${PACKAGE} ]]; then
            PACKAGE_LIST+=" ${PACKAGE}"
        fi
    done < "${DIR_NAME}/package-list"
    sudo dnf update -y
    sudo dnf install -y ${PACKAGE_LIST}
}

function link_dot_files {
    ${LINK_S}
}

createDirectories && \
install_bash_it && \
install_sdkman && \
install_nvm && \
install_packages && \
link_dot_files
