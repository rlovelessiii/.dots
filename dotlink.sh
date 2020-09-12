#!/usr/bin/env bash

# ~/.dots/dotlink.sh
# author: RLovelessIII
# description: Designed to create Symbolic Links for Unix '.' configuration files

# Get current directory and operating system
OS=$(uname)


if [[ ${OS} == "Linux" ]]; then
    for DIR in *; do
        if [[ -d ${DIR} ]]; then
            cd ${DIR}
            for ITEM in *; do
                ln -s $(pwd)/${ITEM} ~/.testlinks/.${ITEM}
            done
        fi
    done
else
    echo "TODO"
fi
