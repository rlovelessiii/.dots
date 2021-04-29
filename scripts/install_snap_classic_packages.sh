#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

CONF_DIR="$(dirname "$0")/../config"

sudo ln -s /var/lib/snapd/snap /snap

while read -r line; do
        PACKAGE=$(echo ${line} | cut -d \# -f 1)
        if [[ ${PACKAGE} ]]; then
                sudo snap install ${PACKAGE} --classic
        fi
done < "${CONF_DIR}/snap_classic_packages"

unset CONF_DIR PACKAGE

