#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

declare -a USERSCRIPTS
BASHRC_FILES="$HOME/.bashrc.d"
source "$BASHRC_FILES/utils.d/loader.sh"

load_scripts "$BASHRC_FILES"
