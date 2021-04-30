#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

function link {
	# Check if input is a file or a directory
	if [[ -f "${1}" ]]; then
		file_path="${2}/${1}"
		# Check if output location is a file
		if [[ -f ${file_path} ]]; then
			echo "Creating backup for ${file_path}"
			mv "${file_path}" "${file_path}.bak"
		fi
		# Confirm output location is not a current symlink
		if ! [[ -L "${file_path}" ]]; then
			echo "Creating symlin for ${file_path}..."
			ln -s $(pwd)/${1} ${file_path}
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

echo "Linking ${PARENT_DIR} directory...Finished!"
