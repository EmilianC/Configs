#!/bin/bash

pacman_updates=$(checkupdates 2>/dev/null | wc -l)
flatpak_updates=$(flatpak remote-ls --updates 2>/dev/null | wc -l)

total_updates=$((pacman_updates + flatpak_updates))

printf '{"text": "%s"}' "$total_updates"
