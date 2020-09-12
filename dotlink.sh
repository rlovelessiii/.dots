#!/usr/bin/env bash

# ~/.dots/dotlink.sh
# author: RLovelessIII
# description: Designed to create Symbolic Links for Unix '.' configuration files

# @Params: $1 = Current File/Dir Name $2 = Path to symbolic link
# Recursive function to evaluate the contents of the given directory.
# File vs Directory
function link_search {
    # If the contents are a file, a symbolic link is created
    if [[ -f $1 ]]; then
        echo "Creating SymLink for $1"
        # $(pwd) returns the current directory, where arg $1 is concatenated to provide the absolute file path,
        #   and arg $2 provides the config directory for the link to be created
        ln -sf $(pwd)/$1 $2/$1 && echo "Success!"
    elif [[ -d $1 ]]; then
        cd $1
        # Check if current directory already exists, if not, create it
        if ! [[ -d $2/$1 ]]; then
            mkdir $2/$1
        fi
        # Iterate over the conents of the directory to call itself,
        #   using the current ${ITEM} for arg $1 and concatenating the file path for arg $2
        for ITEM in *; do
            link_search ${ITEM} $2/$1
        done
        cd ..
    fi
}

# Get current directory and operating system
OS=$(uname)

if [[ ${OS} == "Linux" ]]; then
    for PARENT in *; do
        # Allow '*' to include '.' files from here on out
        shopt -s dotglob
        if [[ -d ${PARENT} ]]; then
            cd ${PARENT}
            for CHILD in *; do
                link_search ${CHILD} ~/.testlinks
            done
            cd ..
        fi
    done
elif [[ ${OS} == "Darwin" ]]; then
    echo "TODO"
fi
