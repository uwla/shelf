#!/bin/sh

#############################
##      SHELL PROFILE      ##
#############################

# handy helper
source_files()
{
  while [ $# -gt 0 ]; do
    file=$1
    [ -f "$file" ] && source "$file"
    shift
  done
  return 0
}

# name of the current shell: (bash, zsh, sh, or other)
shell=${SHELL##*/}
[ -n "$BASH_VERSION" ] && shell=bash
[ -n "$ZSH_VERSION" ] && shell=zsh

# load environment variables, aliases, and user funtions.
SHELL_CONFIG=~/.config/shell
source_files $SHELL_CONFIG/{login,env,aliases,functions}

# source private configuration
source_files $SHELL_CONFIG/private/*

# load system bin directories from specific programming language packages
path_append /usr/bin/vendor_perl ~/.local/share/python/bin ~/.local/share/npm/bin

# load local bin
path_prepend ~/.local/bin

# source custom shell completion, keybindings, and plugins
source_files $SHELL_CONFIG/{keybindings,completion,plugins}/*.$shell

# set tabsize to 2
# tabs -2

# default permission mask
# umask 077
