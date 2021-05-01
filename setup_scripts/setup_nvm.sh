#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)

echo "Downloading NVM..."
git clone https://github.com/nvm-sh/nvm.git ~/.nvm_sh
echo "Downloading NVM...Done!"

echo "Installing NVM..."
~/.nvm_sh/install.sh
echo "Installing NVM...Done!"

