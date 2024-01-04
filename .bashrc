#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set vi mode for readline/commandline

bind "set editing-mode vi"
bind "set show-mode-in-prompt on"
bind "set show-all-if-ambiguous on"
bind "set vi-ins-mode-string \1\e[6 q\2"
bind "set vi-cmd-mode-string \1\e[2 q\2"

# Source command-not-found hook
source /usr/share/doc/pkgfile/command-not-found.bash

alias ls='ls --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/Projects/polin/config --work-tree=$HOME'

PS1=' \$ '

# import git completion for config
source /usr/share/bash-completion/completions/git
__git_complete config __git_main
