#!/bin/bash

CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/style.css $HOME/.config/waybar/modules.jsonc"

while true; do
  waybar &
  inotifywait -e create,modify $CONFIG_FILES
  killall waybar
done
