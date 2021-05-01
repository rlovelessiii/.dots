#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

echo "Dotfiles Setup Initialized..."

SCRIPT_DIR="$(dirname "$0")/setup_scripts"

${SCRIPT_DIR}/install_dnf_packages.sh && \
${SCRIPT_DIR}/setup_docker.sh && \
${SCRIPT_DIR}/setup_bashit.sh && \
${SCRIPT_DIR}/setup_sdkman.sh && \
${SCRIPT_DIR}/setup_nvm.sh && \

echo "Dotfiles Setup Initialized...Finished!"
echo "Please reboot device and run the \"setup_final.sh\" script to finished setting up this machine."

unset SCRIPT_DIR
