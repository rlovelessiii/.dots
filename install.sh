#!/usr/bin/env bash

# ~/.dots/dotlink.sh
# author: RLovelessIII
# description: Designed to create Symbolic Links for Unix '.' configuration files

if [[ $(uname) == "Linux" ]]; then
    . /etc/os-release
    if [[ $NAME == "Fedora" ]]; then
	    cd "$(dirname "$0")/scripts"
	    echo "Creating Directories..." && \
	    . create_directories.sh &>/dev/null & && \
	    echo "Installing Bash-It..." && \
	    . install_bashit.sh &>/dev/null & && \
	    echo "Installing SDK-Man..." && \
	    . install_sdkman.sh &>/dev/null & && \
	    echo "Installing NVM..." && \
	    . install_nvm.sh &>/dev/null & && \
	    echo "Installing DNF Packages..." && \
	    . install_dnf_packages.sh &>/dev/null & && \
	    echo "Installing Snap Packages..." && \
	    . install_snap_packages.sh &>/dev/null & && \
	    echo "Installing Classic Snap Packages..." && \
	    . install_snap_classic_packages.sh &>/dev/null & && \
	    echo "Installing Docker..." && \
	    . install_docker.sh &>/dev/null & && \
	    echo "Linking Dotfiles..." && \
	    . link_dotfiles.sh "../dotfiles/home" $HOME &>/dev/null & 
    fi
fi
