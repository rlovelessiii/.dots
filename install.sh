#!/usr/bin/env bash

# ~/.dots/dotlink.sh
# author: RLovelessIII
# description: Designed to create Symbolic Links for Unix '.' configuration files

if [[ $(uname) == "Linux" ]]; then
    . /etc/os-release
    if [[ $NAME == "Fedora" ]]; then
	    cd "$(dirname "$0")/scripts"
	    . create_directories.sh && \
	    . install_bashit.sh && \
	    . install_sdkman.sh && \
	    . install_nvm.sh && \
	    . install_dnf_packages.sh && \
	    . install_snap_packages.sh && \
	    . install_snap_classic_packages.sh && \
	    . install_docker.sh
	    . link_dotfiles.sh "../dotfiles/home" $HOME
    fi
fi
