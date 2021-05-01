#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)
# Commands pulled from https://docs.docker.com/engine/install/fedora/

if ! [[ $(command -v docker) ]]; then
    echo "Removing old Docker packages..."
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
    echo "Removing old Docker packages...Done!"

    echo "Installing Docker dependencies..."
    sudo dnf install -y dnf-plugins-core
    echo "Installing Docker dependencies...Done!"

    echo "Adding Docker Repository..."
    sudo dnf config-manager \
        --add-repo \
        https://download.docker.com/linux/fedora/docker-ce.repo
    echo "Adding Docker Repository...Done!"

    echo "Installing Docker..."
    sudo dnf install -y docker-ce docker-ce-cli containerd.io
    echo "Installing Docker...Done!"

    echo "Adding $(whoami) to the Docker group..."
    sudo usermod -aG docker $(whoami)
    echo "Adding $(whoami) to the Docker group...Done!"
else
    echo "Docker is already installed."
fi

