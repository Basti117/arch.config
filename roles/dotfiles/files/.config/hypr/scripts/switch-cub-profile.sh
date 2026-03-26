#!/usr/bin/env bash
export PATH="$HOME/.local/bin:$PATH"

selection=$(cub ls -o json | jq -r '.[] | .profile' | sort -u | rofi -dmenu -p "Select Theme:")

if [ -n "$selection" ]; then
    cub apply $selection
fi
