#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

echo "Updating Symbolic Links..."

LINK_SCRIPT="$(dirname "$0")/home/.scripts/link.sh"

${LINK_SCRIPT} ./home $HOME

echo "Updating Symbolic Links...Finished!"
