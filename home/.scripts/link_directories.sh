#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

function link {
	# Check if input is a file or a directory
	if [[ -f "${1}" ]]; then
		symlink_path="${2}/${1}"
		# Confirm output location is not a current symlink
		if ! [[ -L "${symlink_path}" ]]; then
			# Check if output location is a file
			if [[ -f ${symlink_path} ]]; then
				echo "Creating backup for ${symlink_path}"
				mv "${symlink_path}" "${symlink_path}.bak"
			fi
			echo "Creating symlin for ${symlink_path}..."
			ln -s $(pwd)/${1} ${symlink_path}
		fi
	elif [[ -d ${1} ]]; then
		mkdir -p ${2}/${1}
		cd ${1}
		for content in *; do
			link $content ${2}/${1}
		done
		cd ..
	fi
}

# @Params:
#	$1 = Parent directory for symlinks
#	$2 = Base path for symlinks

PARENT_DIR=${1}
SYM_LINK=${2}

echo "Linking ${PARENT_DIR} directory..."

# Allow '*' to lnclude '.' files
shopt -s dotglob

cd ${PARENT_DIR}

for child in *; do
	link ${child} ${SYM_LINK}
done

echo "Linking ${PARENT_DIR} directory...Done!"

