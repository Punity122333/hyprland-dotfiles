#!/bin/bash

# Show a toast/notification (needs notify-send installed)
notify-send "🚀 Hyprland" "Restarting... hold on to your rice."

# Give it a moment so you can see the toast
sleep 0.8

# Kill Hyprland (all windows go poof)
pkill -u "$USER" -x Hyprland

# Respawn Hyprland
exec Hyprland

