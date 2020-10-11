#!/usr/bin/env bash

# Author: Richard Loveless III (rlovelessiii)
# Description: Script to automate linking and backing up config files in order to keep everything under version control.

# @Params: $1 = Current File/Dir Name $2 = Path to symbolic link
# Recursive function to evaluate the contents of the given directory.
# File vs Directory
function link {
    # If the contents are a file, a symbolic link is created
    if [[ -f $1 ]]; then
        # $(pwd) returns the current directory, where arg $1 is concatenated to provide the absolute file path,
        #   and arg $2 provides the config directory for the link to be created
        if [[ -f $2/$1 ]]; then
            # Check to see if found file is currently a syslink
            if ! [[ -L $2/$1 ]]; then
                echo "Creating backup for $2/$1"
                mv $2/$1 ~/.backups/.dots/$1
            fi
        fi
        if ! [[ -L $2/$1 ]]; then
            echo "Creating symlink for $2/$1..."
            ln -s $(pwd)/$1 $2/$1
        fi
    elif [[ -d $1 ]]; then
        cd $1
        $(dirname "$0")/mkpath.sh $2/$1
        # Iterate over the conents of the directory to call itself,
        #   using the current ${ITEM} for arg $1 and concatenating the file path for arg $2
        for content in *; do
            link $content $2/$1
        done
        cd ..
    fi
}

# @Params: $1 = Parent directory to start linking, $2 = Root base path for syslink
cd ${1}
echo "Linking $1 directory..."
# Allow '*' to include '.' files
shopt -s dotglob
for child in *; do
    link $child $2
done
echo "...$1 directory complete!"

