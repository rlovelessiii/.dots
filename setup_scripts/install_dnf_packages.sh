#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

CONF_DIR="$(dirname "$0")/config"

echo "Updating DNF..."
sudo dnf update -y
echo "Updating DNF...Done!"

while read -r line; do
	PACKAGE=$(echo ${line} | cut -d \# -f 1)
	if [[ ${PACKAGE} ]]; then
		PACKAGE_LIST+=" ${PACKAGE}"
	fi
done < "${CONF_DIR}/dnf_packages"

echo "Installing DNF Packages..."
sudo dnf install -y ${PACKAGE_LIST}
echo "Installing DNF Packages...Done!"

unset CONF_DIR PACKAGE PACKAGE_LIST

