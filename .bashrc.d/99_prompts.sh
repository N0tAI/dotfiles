#!/usr/bin/bash

# export PROMPT_COMMAND

export PS0=""
export PS1='[\H/\u/\s \W]> '
export PS2='in> '
export PS3='> '
export PS4='-> '

load_scripts "$BASHRC_FILES/prompts.d"
