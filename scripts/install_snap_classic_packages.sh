#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

CONF_DIR="$(dirname "$0")/config"

echo "Setting Up Classic Snap Support..."
sudo ln -s /var/lib/snapd/snap /snap

echo "Installing Classic Snap Packages..."
while read -r line; do
        PACKAGE=$(echo ${line} | cut -d \# -f 1)
        if [[ ${PACKAGE} ]]; then
                sudo snap install ${PACKAGE} --classic
        fi
done < "${CONF_DIR}/snap_classic_packages"

unset CONF_DIR PACKAGE

