#!/usr/bin/bash

export HISTCONTROL="ignoredups:ignorespace"
export HISTIGNORE="clear:exit:history"
export HISTSIZE=1024
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S %Z "

load_script "$BASHRC_FILES/history.d"
