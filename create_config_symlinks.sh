#!/bin/sh

THIS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

create_symlink()
{
	local destination="$1"
	local source="$2"

	echo "src:'$source' -> dst:'$destination'"

	if [ ! -e "$destination" ]; then
		echo "  > Error: destination does not exist."
		return
	fi

	if [ -d "$source" ]; then
		# Is it a symlink to the desired location already?
		local current_link=$(readlink -f "$source")
		if [[ "$current_link" == "$destination" ]]; then
			echo "  > Success (already linked)"
			return
		else
			echo "  > Error: Source already exists."
			return
		fi
	fi

	if ln -s "$destination" "$source" ; then
		echo "  > Success"
	else
		echo "  > Error: Linking failed."
	fi
}

create_symlink "$THIS_DIR/.config/gamemode.ini" "$HOME/.config/gamemode.ini"
create_symlink "$THIS_DIR/.config/hypr" "$HOME/.config/hypr"
create_symlink "$THIS_DIR/.config/matugen" "$HOME/.config/matugen"
create_symlink "$THIS_DIR/.config/pipewire" "$HOME/.config/pipewire"
create_symlink "$THIS_DIR/.config/waybar" "$HOME/.config/waybar"
create_symlink "$THIS_DIR/.config/wob" "$HOME/.config/wob"
create_symlink "$THIS_DIR/.config/wofi" "$HOME/.config/wofi"
create_symlink "$THIS_DIR/.config/yazi" "$HOME/.config/yazi"
