#!/usr/bin/bash

if command -v "${EDITOR}" &> /dev/null; then
	alias e="${EDITOR} "
	alias edit="${EDITOR}"
	alias editor="${EDITOR}"
fi
if command -v "${VISUAL}" &> /dev/null; then
	alias v="${VISUAL}"
fi

alias nv='nvim '
alias nvd='nvim -d '
alias nvr='nvim -R '
alias nvn='nvim --noplugin '
