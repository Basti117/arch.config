#!/usr/bin/env bash

monitors=$(hyprctl monitors -j)

# only run this if there a two monitors
right=$(echo "${monitors}" | jq -r "sort_by(.id) | .[0].name")
left=$(echo "${monitors}" | jq -r "sort_by(.id) | .[1].name")

left_width=$(echo "${monitors}" | jq -r ".[] | select(.id==\"${left}\") | .width")

hyprctl keyword monitor "${left},preferred,0x0,1"
hyprctl keyword monitor "${right},preferred,${left_width}x0,1"
