#!/usr/bin/env bash

# ~/.dots/dotlink.sh
# author: RLovelessIII
# description: Designed to create Symbolic Links for Unix '.' configuration files

if [[ $(uname) == "Linux" ]]; then
    . /etc/os-release
    if [[ $NAME == "Fedora" ]]; then
	. "$(dirname "$0")"/setup_fedora.sh
    fi
fi
