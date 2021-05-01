#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

DIR_NAME=$(dirname "$0")
SCRIPT_DIR="${DIR_NAME}/setup_scripts"

echo "Dotfiles Setup Initialized..."

printf "Installing DNF Packages..." && \
${SCRIPT_DIR}/install_dnf_packages.sh > ${SCRIPT_DIR}/install_dnf_packages.log && \
echo "Done!" && \
printf "Installing Docker..." && \
${SCRIPT_DIR}/install_docker.sh > ${SCRIPT_DIR}/install_docker.log && \
echo "Done!" && \
printf "Installing Bash-It..." && \
${SCRIPT_DIR}/install_bashit.sh > ${SCRIPT_DIR}/install_bashit.log && \
echo "Done!" && \
printf "Installing SDK-Man..." && \
${SCRIPT_DIR}/install_sdkman.sh > ${SCRIPT_DIR}/install_sdkman.log && \
echo "Done!" && \
printf "Installing NVM..." && \
${SCRIPT_DIR}/install_nvm.sh > ${SCRIPT_DIR}/install_nvm.log && \
echo "Done!" && \

echo "Dotfiles Setup Initialized...Done!"

unset SCRIPT_DIR

