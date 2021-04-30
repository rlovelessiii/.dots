#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

function link {
	# Check if input is a file or a directory
	if [[ -f "${1}" ]]; then
		# Check if output location is a file
		if [[ -f "${2}/${1}" ]]; then
			echo "Creating backup for ${2}/${1}"
			mkdir -p ${3}/${1}
			mv "${2}/${1}" "${3}/${1}.bak"
		fi
		# Confirm output location is not a current symlink
		if ! [[ -L "${2}/${1}" ]]; then
			echo "Creating symlin for ${2}/${1}..."
			ln -s $(pwd)/${1} ${2}/${1}
		fi
	elif [[ -d ${1} ]]; then
		mkdir -p ${2}/${1}
		cd ${1}
		for content in *; do
			link $content ${2}/${1} ${3}/${1}
		done
		cd ..
	fi
}

# @Params:
#	$1 = Parent directory for symlinks
#	$2 = Base path for symlinks

PARENT_DIR=${1}
SYMLINK=${2}
BACKUP_DIR=${2}/.backups

echo "Linking ${PARENT_DIR} directory..."

# Allow '*' to lnclude '.' files
shopt -s dotglob

cd ${PARENT_DIR}

for child in *; do
	link ${child} ${SYMLINK} ${BACKUP_DIR}
done

echo "Linking ${PARENT_DIR} directory...Finished!"
