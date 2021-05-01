#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

echo "Dotfiles Setup Being Finalized..."

DIR_NAME=$(dirname "$0")
SCRIPT_DIR="${DIR_NAME}/setup_scripts/"

printf "Installing Snap Packages..." && \
${SCRIPT_DIR}/install_snap_packages.sh > ${SCRIPT_DIR}/install_snap_packages.log && \
echo "Done!" && \
printf "Setting Up Directories..." && \
${SCRIPT_DIR}/setup_directories.sh > ${SCRIPT_DIR}/setup_directories.log && \
echo "Done!" && \
printf "Creating Symbolic Links..." && \
${DIR_NAME}/update_links.sh > ${DIR_NAME}/update_links.log && \
echo "Done!" && \

echo "Dotfiles Setup Being Finalized...Done!"

unset DIR_NAME SCRIPT_DIR

