#!/usr/bin/env bash

# Terminate already running instance
killall -q picom

# Launch Picom
picom -b
