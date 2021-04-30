#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

echo "Dotfiles Setup Initialized..."

SCRIPT_DIR="$(dirname "$0")/home/.scripts/"

. ${SCRIPT_DIR}/install_dnf_packages.sh && \
. ${SCRIPT_DIR}/setup_docker.sh && \
. ${SCRIPT_DIR}/setup_bashit.sh && \
. ${SCRIPT_DIR}/setup_sdkman.sh && \
. ${SCRIPT_DIR}/setup_nvm.sh && \

echo "Dotfiles Setup Initialized...Finished!"

printf "Would you like to reboot now? [y/n]: "
read reboot?
if [[ reboot? ]]; then
	reboot
fi

unset SCRIPT_DIR
