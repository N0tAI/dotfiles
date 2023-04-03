#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function get_abs_filename() {
  echo -e "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}
function is_valid_script() {
	[ -z "$1" ] && [ -f "$1" ] && [ -r "$1" ]
}
function loadscript() {
	if [ -d "$1" ] && [ -r "$1" ] && [ -x "$1" ]; then
		for file in $(get_abs_filename "$1")/*; do
			loadscript "$file"
		done
	elif is_valid_script "$1" ; then
		USERSCRIPTS[${#USERSCRIPTS[@]}]+="$(get_abs_filename "$1")"
		source "$1"
	else
		echo -e "\e[31mWARNING\e[0m] The path '$1' is not an executable script."	
	fi
}

declare -a USERSCRIPTS
loadscript "./.bashrc.d"
