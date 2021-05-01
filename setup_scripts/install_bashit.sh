#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

echo "Installing Bash-It..."

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
~/.bash_it/install.sh --silent

echo "Installing Bash-It...Done!"

