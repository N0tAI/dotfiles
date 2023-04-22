#!/usr/bin/bash

cal() {
	cd "$1" && ls -A --color=auto
}
cwd() {
	cd "$1" && pwd -P
}
cwl() {
	cd "$1" && pwd -P && ls -A --color=auto
}
