#!/usr/bin/env bash
# Basic xinitrc

xmodmap -e "clear lock"

# Set ModKey used by window manager
xmodmap -e "keysym Caps_Lock = Super_L Caps_Lock"

# Set key-repeat-rate and delay
xset r rate 250 50

# Turn off the F**K bell
xset -b

exec i3
