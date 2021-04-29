#!/usr/bin/env bash

# Author: Richard C. Loveless III (rlovelessiii)
# Commands pulled from https://docs.docker.com/engine/install/fedora/

echo "Installing Docker..."

sudo dnf remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine &>/dev/null &

sudo dnf install -y dnf-plugins-core &>/dev/null &

sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo &>/dev/null &

sudo dnf install -y docker-ce docker-ce-cli containerd.io &>/dev/null &
