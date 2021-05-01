#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

DIR_NAME=$(dirname "$0")
SCRIPT_DIR="${DIR_NAME}/setup_scripts/"

echo "Dotfiles Setup Being Finalized..." && \
${SCRIPT_DIR}/install_snap_packages.sh && \
${SCRIPT_DIR}/setup_directories.sh && \
${DIR_NAME}/update_links.sh && \
echo "Dotfiles Setup Being Finalized...Done!"

unset DIR_NAME SCRIPT_DIR

