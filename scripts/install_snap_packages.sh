#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

CONF_DIR="$(dirname "$0")/config"

echo "Installing Snap Packages..."
while read -r line; do
	PACKAGE=$(echo ${line} | cut -d \# -f 1)
	if [[ ${PACKAGE} ]]; then
		sudo snap install ${PACKAGE}
	fi
done < "${CONF_DIR}/snap_packages"

unset CONF_DIR PACKAGE


