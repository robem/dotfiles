# US & DE layout; Hold both (left and right) shifts to switch
setxkbmap -layout us,de
setxkbmap us,de -option 'grp:shifts_toggle'

# i3 uses `Mod4` which is set to Super_L (Windows key by default)
# Map Caps_Lock to Super_L so it can be used alternatively
# Caps lock can still be used via Shift+Caps_Lock
xmodmap -e "clear lock" -e "keysym Caps_Lock = Super_L Caps_Lock"

# Set key-repeat-rate and delay
xset r rate 250 50

# Turn off the F**K bell
xset -b

export TERM=st-256color
export COLORTERM=truecolor
export TERMINAL=/usr/bin/st
export SHELL=/bin/bash
export EDITOR=/usr/bin/kak
export BROWSER=/usr/bin/firefox

export I3RS_GITHUB_TOKEN=$(cat ~/.github_token)

exec i3
