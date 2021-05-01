#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

echo "Installing DNF Packages..."

CONF_DIR="$(dirname "$0")/config"

while read -r line; do
	PACKAGE=$(echo ${line} | cut -d \# -f 1)
	if [[ ${PACKAGE} ]]; then
		PACKAGE_LIST+=" ${PACKAGE}"
	fi
done < "${CONF_DIR}/dnf_packages"

sudo dnf update -y && \
sudo dnf install -y ${PACKAGE_LIST}

unset CONF_DIR PACKAGE PACKAGE_LIST

echo "Installing DNF Packages...Done!"

