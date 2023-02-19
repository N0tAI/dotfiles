#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias echo="echo -e"
PS1='[\u@\h \W]\$ '

function get_abs_filename() {
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}
function is_valid_script() {
	if [ -z "$1" ]; then
		return 1
	fi
	if [ -f "$1" ] && [ -r "$1" ]; then
		return 0
	else
		return 1
	fi
}
function loadscript() {
	if [ -d "$1" ] && [ -r "$1" ] && [ -x "$1" ]; then
		for file in $(get_abs_filename "$1")/*; do
			loadscript "$file"
		done
	elif is_valid_script "$1" ; then
		export USERSCRIPTS="$USERSCRIPTS:$(get_abs_filename "$1")"
		source "$1"
	else
		echo "\e[31mWARNING\e[0m] The path '$1' is not an executable script."	
	fi
}

loadscript "./.bashfiles"
