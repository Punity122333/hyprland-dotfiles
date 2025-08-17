#!/bin/bash

options=(
  "  Power Off"
  "  Reboot"
  "  Lock"
  "  Logout"
  "  Cancel"
)

choice=$(printf "%s\n" "${options[@]}" | rofi -dmenu -i -p " Power Options" -theme ~/.config/rofi/powermenu.rasi)

case "$choice" in
  *Power*) systemctl poweroff ;;
  *Reboot*) systemctl reboot ;;
  *Lock*) hyprlock ;;  # or swaylock, betterlockscreen
  *Logout*) hyprctl dispatch exit ;;
  *Cancel*) exit 0 ;;
esac
