#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

LINK_SCRIPT="$(dirname "$0")/home/.scripts/link_directories.sh"

echo "Updating Symbolic Links..."
${LINK_SCRIPT} "$(dirname "$0")/home" $HOME
echo "Updating Symbolic Links...Finished!"

unset LINK_SCRIPT

