#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)
# Commands pulled from https://docs.docker.com/engine/install/fedora/

echo "Installing Docker..."

if ! [[ $(command -v docker) ]]; then
    sudo dnf remove -y docker \
        docker-client \
        docker-client-latest \
        docker-common \
        docker-latest \
        docker-latest-logrotate \
        docker-logrotate \
        docker-selinux \
        docker-engine-selinux \
        docker-engine

    sudo dnf install -y dnf-plugins-core

    sudo dnf config-manager \
        --add-repo \
        https://download.docker.com/linux/fedora/docker-ce.repo

    sudo dnf install -y docker-ce docker-ce-cli containerd.io

    sudo usermod -aG docker $(whoami)
else
    echo "Docker is already installed."
fi

echo "Installing Docker...Done!"

