#!/usr/bin/env bash

# ~/.dots/dotlink.sh
# author: RLovelessIII
# description: Designed to create Symbolic Links for Unix '.' configuration files

# Globals
BASE_PATHS=(~/.testlinks /etc)

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
                if ! [[ -d ~/.testlinks/.backups ]]; then
                    mkdir ~/.testlinks/.backups
                fi
                if ! [[ -d ~/.testlinks/.backups/.dots ]]; then
                    mkdir ~/.testlinks/.backups/.dots
                fi
                echo "Creating backup for $2/$1"
                mv $2/$1 ~/.testlinks/.backups/.dots/$1
            fi
        fi
        echo "Creating symlink for $2/$1..."
        ln -sf $(pwd)/$1 $2/$1
    elif [[ -d $1 ]]; then
        cd $1
        # Check if current directory already exists, if not, create it
        if ! [[ -d $2/$1 ]]; then
            echo "Creating directory $2/$1..."
            mkdir $2/$1
        fi
        # Iterate over the conents of the directory to call itself,
        #   using the current ${ITEM} for arg $1 and concatenating the file path for arg $2
        for content in *; do
            link $content $2/$1
        done
        cd ..
    fi
}

# @Params: $1 = Parent directory to start linking, $2 = Root base path for syslink
function parent_dir {
    cd $1
    echo "Starting $1 directory..."
    # Allow '*' to include '.' files
    shopt -s dotglob
    for child in *; do
        link $child $2
    done
    echo "...$1 directory complete!"
    cd ..
}

# Get current directory and operating system
OS=$(uname)

if [[ $OS == "Linux" ]]; then
    echo "Linking..."
    parent_dir ./home ~/.testlinks
    echo "Linking Complete!"
elif [[ $OS == "Darwin" ]]; then
    echo "TODO"
fi
