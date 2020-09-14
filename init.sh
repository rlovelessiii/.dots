#!/usr/bin/env bash

# ~/.dots/dotlink.sh
# author: RLovelessIII
# description: Designed to create Symbolic Links for Unix '.' configuration files

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
        echo "Creating symlink for $2/$1..."
        ln -sf $(pwd)/$1 $2/$1
    elif [[ -d $1 ]]; then
        cd $1
        check_path $2/$1
        # Iterate over the conents of the directory to call itself,
        #   using the current ${ITEM} for arg $1 and concatenating the file path for arg $2
        for content in *; do
            link $content $2/$1
        done
        cd ..
    fi
}

# @Params: $1 = Parent directory to start linking, $2 = Root base path for syslink
function link_dir {
    cd $1
    echo "Linking $1 directory..."
    # Allow '*' to include '.' files
    shopt -s dotglob
    for child in *; do
        link $child $2
    done
    echo "...$1 directory complete!"
    cd ..
}

function install_packages {
    echo "Installing packages..."
    yay -Syyu \
        # Browsers
        firefox-developer-edition \
        chromium \
        # KVM
        barrier \
        # Bluetooth Manager
        blueman \
        # Clipboard
        xclip \
        # Text Editors
        neovim \
        typora \
        # Sync Google Drive
        insync \
        # Compositor (kiwase-blur & rounded-corners)
        picom-ibhagwan-git \
        # Cursor
        bibata-cursor-theme \
        # Status-bar
        polybar \
        # Color-scheme generator
        python-pywal \
        # Widget & Icon theme generator
        themix-full-git \
        # IDE's
        intellij-idea-ultimate-edition \
        webstorm \
        pycharm-professional
}

function install_bash_it {
    echo "Installing Bash-It..."
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
        ~/.bash_it/install.sh --no-modify-config && \
        echo "Done! Bash-It Installed"
}

# @Params: $1 = full path to directory to check, must prefix with a forward-slash '/'
function check_path {
    IFS='/' read -r -a DIRS <<< $1
    # Remove null first element
    DIRS=("${DIRS[@]:1}")
    DIR_PATH=""
    for DIR in "${DIRS[@]}"; do
        DIR_PATH=$DIR_PATH/$DIR
        if ! [[ -d $DIR_PATH ]]; then
            echo "Creating directory $DIR_PATH"
            mkdir $DIR_PATH
        fi
    done
    
    unset DIRS DIR_PATH
}

function create_dirs {
    DIRS=( \
        # Backup for dots
        ~/.backups/dots \
        # VIM directories
        ~/.vim/.backup \
        ~/.vim/.swp \
        ~/.vim/.undo \
    )
    for DIR in "${DIRS[@]}"; do
        check_path $DIR
    done

    unset DIRS
}

function ssh_setup {
    echo "Configuring SSH..."
    ssh-keygen -t rsa -b 4096 -C "$(git config user.email)" -f ~/.ssh/id_rsa_github -N "" && \
        xclip -sel clip < ~/.ssh/id_rsa_github
    echo "Github ssh-key has been copied to the clipboard..."
    echo "Opening https://github.com/login"
    $BROWSER --new-window https://github.com/login & disown
}

if [[ $(uname) == "Linux" ]]; then
    # Create needed directories
    create_dirs && \
    # Install packages from Manjaro Official & AUR
    install_packages && \
    # Install Bash-It
    install_bash_it && \
    # Symlink dot files
    link_dir $(pwd)/home ~ && \
    # Setup SSH keys
    ssh_setup
elif [[ $(uname) == "Darwin" ]]; then
    echo "TODO"
fi
