export TERM="xterm-256color"
export EDITOR="kak"
export BROWSER="firefox"

# Set Mod4 key to CapsLock
xmodmap -e "clear lock"
xmodmap -e "keysym Caps_Lock = Super_L Caps_Lock"

# Set key-repeat-rate and delay
xset r rate 250 50

# Turn off the F**K bell
xset -b

# dwm status line
xsetroot -name "$(date +%Z%Y-%m-%dT%H:%M)"

exec dwm
