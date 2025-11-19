#!/bin/sh

THIS_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STATE_FILE="$THIS_SCRIPT_DIR/.wallpaper_state"
WALLPAPER_ROOT_PATH=~/Pictures/Wallpapers/hypr/

get_wallpaper()
{
	if [[ -f "$STATE_FILE" ]]; then
		cat "$STATE_FILE"
	else
		echo "No state file: '$STATE_FILE'"
		exit 1
	fi
}

set_wallpaper()
{
	local wallpaper_file="$1"
	if [[ ! -f "$wallpaper_file" ]]; then
		echo "Error: '$wallpaper_file' does not exist."
		exit 1
	fi

	# Record all existing swaybg instances.
	# They will be cleaned up after the switch.
	IFS=' ' read -r -a pids <<< $(pidof swaybg)

	swaybg -m fill -i "$wallpaper_file" & disown
	echo "$wallpaper_file" > "$STATE_FILE"

	# Ensure the wallpaper has had time to
	# display, then remove the old processes.
	(
		sleep 4
		kill -9 "${pids[@]}"
	) &
}

select_wallpaper()
{
	readarray -t files < <(find $WALLPAPER_ROOT_PATH -type f)

	local options=""
	for file in "${files[@]}"; do
		options+=${file/#$WALLPAPER_ROOT_PATH}
		options+=$'\n'
	done

	local chosen=$(printf "$options" | wofi --conf ~/.config/hypr/scripts/wallpaper_menu.conf)

	local NEW_WALLPAPER=$WALLPAPER_ROOT_PATH$chosen
	set_wallpaper $NEW_WALLPAPER
}

if [[ "$1" == "-s" ]]; then
	select_wallpaper
elif [[ -n "$1" ]]; then
	set_wallpaper "$1"
else
	get_wallpaper
fi

exit 0
