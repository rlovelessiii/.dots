#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)


CONF_DIR="$(dirname "$0")/config"

echo "Symlinking Snap executable..."
snap --version &>/dev/null && \
sudo ln -s /var/lib/snapd/snap /snap && \
echo "Symlinking Snap executable...Done!"

while read -r line; do
	PACKAGE=$(echo ${line} | cut -d \# -f 1)
	if [[ ${PACKAGE} ]]; then
        echo "Installing '${PACKAGE}' Snap Package..."
		sudo snap install ${PACKAGE} --classic
        echo "Installing '${PACKAGE}' Snap Package...Done!"
	fi
done < "${CONF_DIR}/snap_packages"

unset CONF_DIR PACKAGE

