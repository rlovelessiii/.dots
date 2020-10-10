#!/usr/bin/env bash
# ~/.dots/home/.scripts/ssh_setup.sh
# Author: Richard Loveless III (rlovelessiii)

ID=$1

if [[ ${ID} == "github" ]]; then
    echo "Configuring SSH..."
    ssh-keygen -t rsa -b 4096 -C "$(git config user.email)" -f ~/.ssh/id_rsa_github -N "" && \
        eval "$(ssh-agent -s)" && \
        ssh-add ~/.ssh/id_rsa_github && \
        cd $HOME/.dots && \
        git remote set-url origin git@github.com:rlovelessiii/.dots.git && \
        xclip -sel clip < ~/.ssh/id_rsa_github.pub && \
        $BROWSER --new-window https://github.com/login & disown
fi
