#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

echo "Dotfiles Setup Being Finalized..."

SCRIPT_DIR="$(dirname "$0")/setup_scripts/"

${SCRIPT_DIR}/install_snap_packages.sh && \
${SCRIPT_DIR}/setup_directories.sh && \
$(dirname "$0")/update_links && \

echo "Dotfiles Setup Being Finalized...Done!"

