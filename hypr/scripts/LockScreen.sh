#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##

# For Hyprlock
#pidof hyprlock || hyprlock -q loginctl lock-session

#!/bin/bash

# Run hyprlock with a config
exec hyprlock -c ~/.config/hypr/hyprlock.conf
