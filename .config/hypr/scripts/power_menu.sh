#!/bin/sh

CHOSEN=$(printf "Cancel\nShutdown\nReboot\nLog Out" | wofi --conf ~/.config/hypr/scripts/power_menu.conf)

case "$CHOSEN" in
	"Shutdown") poweroff ;;
	"Reboot")   reboot ;;
	"Log Out")  hyprctl dispatch exit ;;
esac
