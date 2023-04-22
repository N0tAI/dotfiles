#!/usr/bin/bash

shopt -s dotglob extglob extquote force_fignore globstar histappend histverify lithist nocaseglob nocasematch progcomp progcomp_alias promptvars xpg_echo 1> /dev/null
shopt -u sourcepath 1> /dev/null

load_scripts "$BASHRC_FILES/shopts.d/"
