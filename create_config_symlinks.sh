#!/bin/sh

THIS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

create_directory_symlink()
{
	local target_folder="$1"
	local start_folder="$2"

	echo "src:'$start_folder' -> dst:'$target_folder'"

	if [ ! -d "$target_folder" ]; then
		echo "  > Error: Target folder does not exist."
		return
	fi

	if [ -d "$start_folder" ]; then
		# Is it a symlink to the desired location already?
		local current_link=$(readlink -f "$start_folder")
		if [[ "$current_link" == "$target_folder" ]]; then
			echo "  > Success (already linked)"
			return
		else
			echo "  > Error: Source folder already exists."
			return
		fi
	fi

	if ln -s "$target_folder" "$start_folder" ; then
		echo "  > Success"
	else
		echo "  > Error: Linking failed."
	fi
}

create_directory_symlink "$THIS_DIR/.config/hypr" "$HOME/.config/hypr"
create_directory_symlink "$THIS_DIR/.config/pipewire" "$HOME/.config/pipewire"
create_directory_symlink "$THIS_DIR/.config/ricemood" "$HOME/.config/ricemood"
create_directory_symlink "$THIS_DIR/.config/waybar" "$HOME/.config/waybar"
create_directory_symlink "$THIS_DIR/.config/wofi" "$HOME/.config/wofi"
