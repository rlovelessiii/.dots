#!/usr/bin/env bash

# Author: Richard Loveless (rlovelessiii)
# Description: Launch script for Barrier Configuration

# Ensure all instances of Barrier are terminated
killall barrier && \
    killall barriers && \
    killall barrierc

barrierc --no-tray --debug INFO --name $(hostname) --enable-crypto [192.168.1.196]:24800
