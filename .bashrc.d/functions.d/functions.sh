#!/usr/bin/bash

pwl() {
	pwd -P && ls -A --color=auto
}
mkd() {
	mkdir -p $1 && cd "$1"
}
help() {
	"$1" -h || "$1" --help
}
refresh() {
	clear && exec $(basename $(readlink "/proc/$$/exe"))
}
clearh() {
	clear && history -c
}
