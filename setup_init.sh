#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

DIR_NAME=$(dirname "$0")
SCRIPT_DIR="${DIR_NAME}/setup_scripts"

echo "Dotfiles Setup Initialized..." && \
${SCRIPT_DIR}/setup_bashit.sh && \
${SCRIPT_DIR}/setup_sdkman.sh && \
${SCRIPT_DIR}/setup_nvm.sh && \
${SCRIPT_DIR}/setup_docker.sh && \
${SCRIPT_DIR}/install_dnf_packages.sh && \
echo "Dotfiles Setup Initialized...Done!"

unset SCRIPT_DIR

