#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

echo "Setting Up Bash-It..."

echo "Downloading Bash-It..."
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
echo "Downloading Bash-It...Done!"

echo "Installing Bash-It..."
~/.bash_it/install.sh --silent
echo "Installing Bash-It...Done!"

echo "Setting Up Bash-It...Done!"

