#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

CONF_DIR="$(dirname "$0")/../config/"

echo "Creating Directories..."

while read -r line; do
	DIR=$(echo ${line} | cut -d \# -f 1)
	if [[ ${DIR} ]]; then
		DIRS+=( ${DIR} )
	fi
done < "${CONF_DIR}/directories"

for DIR in "${DIRS[@]}"; do
	PARENT=$( echo ${DIR} | cut -d / -f 1 )
	CHILD=$( echo ${DIR} | cut -d / -f 2- )
	if [[ ${PARENT} == "\$HOME" ]]; then
		mkdir -p "${HOME}/${CHILD}"
	elif [[ ${PARENT} == "\$ROOT" ]]; then
		mkdir -p "/${CHILD}"
	fi
done

unset CONF_DIR DIR DIRS
