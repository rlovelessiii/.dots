#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

echo "Dotfiles Setup Being Finalized..."

DIR_NAME=$(dirname "$0")
SCRIPT_DIR="${DIR_NAME}/setup_scripts/"

${SCRIPT_DIR}/install_snap_packages.sh && \
${SCRIPT_DIR}/setup_directories.sh && \
${DIR_NAME}/update_links.sh && \

unset DIR_NAME SCRIPT_DIR

echo "Dotfiles Setup Being Finalized...Done!"

