#!/usr/bin/sh

get_ext() {
	echo -E "${1##*.}"
}
get_abs_path() {
	echo -E "$(realpath "$1")"
}
is_valid_script() {
	if [ ! -z "$1" ] && [ -f "$1" ]; then
		if [ -r "$1" ] && [ -x "$1" ]; then 
			if [ "sh" = "$(get_ext "$1")" ]; then
				return 0;
			fi
		fi
	fi
	return 1;
}
load_script() {
	if is_valid_script "$1"; then
		USERSCRIPTS[${#USERSCRIPTS[@]}]+="$(get_abs_path "$1")"
		. "$1"
	fi
}
load_scripts() {
	if [ ! -d "$1" ]; then
		echo -E "Provided path '$1' is not a valid directory.";
		return 1;
	fi
	if [ ! -r "$1" ]; then
		echo -E "Directory '$1' is not readable.";
		return 1;
	fi
	if [ ! -x "$1" ]; then
		echo -E "Directory '$1' cannot be searched.";
		return 1;
	fi
	for file in `get_abs_path "$1"`/*; do
		load_script "$file"
	done
}
collect_output() {
	if [ ! -z "$1" ]; then
		if [ -r "$1" ]; then
			if [ "list" = "$(get_ext "$1")" ]; then
				< '$1'
			elif [ -x "$1" ] && [ "sh" = "$(get_ext '$1')" ]; then
				'$1'
			else
				return 1;
			fi
			return;
		fi
	fi
	return 1;
}
