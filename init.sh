#!/usr/bin/env bash
# ~/.dots/dotlink.sh
# author: RLovelessIII
# description: Designed to create Symbolic Links for Unix '.' configuration files

if [[ $(uname) == "Linux" ]]; then
    create_dirs && \
    install_bash_it && \
    install_packages && \
    link_dots && \
    finalize && \
    reboot
elif [[ $(uname) == "Darwin" ]]; then
    echo "TODO"
fi
