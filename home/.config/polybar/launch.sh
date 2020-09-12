#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

. ~/.cache/wal/colors.sh # Import Pywal colors
export FS_FORMAT_MOUNTED="%{F${color5}}%{F-} %percentage_used%%" # Filesystem Module --> Format Mounted Label
export POWER_LABEL_OPEN="%{F${color7}}Power %{F-}%{F${color4}}%{F-}" # Powermenu Module --> Open Label
export POWER_LABEL_CLOSE="%{F${color7}}Cancel %{F-}%{F${color4}}%{F-}" # Powermenu Module --> Close Label

# Launch Polybar(s)
polybar top-left >>/tmp/polybar-top-left.log 2>&1 & disown
polybar top-middle >>/tmp/polybar-top-middle.log 2>&1 & disown
polybar top-right >>/tmp/polybar-top-right.log 2>&1 & disown
polybar bottom-left >>/tmp/polybar-bottom-left.log 2>&1 & disown
polybar bottom-right >>/tmp/polybar-bottom-right.log 2>&1 & disown
polybar pseudo-top >>/tmp/polybar-pseudo-top.log 2>&1 & disown
polybar pseudo-bottom >>/tmp/polybar-pseudo-bottom.log 2>&1 & disown
