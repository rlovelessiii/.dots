#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

echo "Installing Snap Packages..."

CONF_DIR="$(dirname "$0")/config"

snap --version && \
sudo ln -s /var/lib/snapd/snap /snap && \

while read -r line; do
	PACKAGE=$(echo ${line} | cut -d \# -f 1)
	if [[ ${PACKAGE} ]]; then
		sudo snap install ${PACKAGE} --classic
	fi
done < "${CONF_DIR}/snap_packages"

echo "Installing Snap Packages...Done!"

unset CONF_DIR PACKAGE

