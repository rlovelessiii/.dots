#!/usr/bin/env bash

# Author: Richard Loveless III (rlovelessiii)
# Description: Update syslinks

LINK_S=$(dirname "$0")/home/.scripts/link.sh

if [[ $(uname) == "Linux" ]]; then
    echo "Linking dotfiles..." && \
    ${LINK_S} $(dirname "$0")/home ${HOME} && \
    echo "Success!"
fi
