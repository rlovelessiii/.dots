#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

CONF_DIR="$(pwd)/../config"

echo "Installing DNF Packages"

while read -r line; do
	PACKAGE=$(echo ${line} | cut -d \# -f 1)
	if [[ ${PACKAGE} ]]; then
		PACKAGE_LIST+=" ${PACKAGE}"
	fi
done < "${CONF_DIR}/dnf_packages"

sudo dnf update -y &>/dev/null &
sudo dnf install -y ${PACKAGE_LIST} &>/dev/null &

unset CONF_DIR PACKAGE PACKAGE_LIST
