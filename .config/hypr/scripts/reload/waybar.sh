#!/bin/sh

# SIGUSR2 is interpreted as a restart request by waybar.
killall -SIGUSR2 waybar
