#!/usr/bin/env bash

# Author: Richard Loveless III (rlovelessiii)
# Description: Update syslinks

DIR_NAME=$(dirname "$0")
LINK_S=${DIR_NAME}/home/.scripts/link.sh

if [[ $(uname) == "Linux" ]]; then
    echo "Linking dotfiles..." && \
    ${LINK_S} ${DIR_NAME}/home ${HOME} && \
    sudo ${LINK_S} ${DIR_NAME}/etc /etc && \
    echo "Success!"
fi
