#!/bin/zsh
source $ZDOTDIR/aliases
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz compinit && compinit
_comp_options+=(globdots)
export LESS_TERMCAP_mb=$'\E[6m'          # begin blinking
export LESS_TERMCAP_md=$'\E[34m'         # begin bold
export LESS_TERMCAP_us=$'\E[0m'       # begin underline
#export LESS_TERMCAP_so=$'\E[1;33m'    # begin standout-mode - info box
export LESS_TERMCAP_me=$'\E[0m'          # end mode
export LESS_TERMCAP_ue=$'\E[0m'          # end underline
export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo ' ('$branch')'
  fi
}
zstyle ':completion:*' list-colors 'di=1;34'
zstyle ':completion:*' menu select
zstyle ':completion:*' file-sort modification
zstyle ':completion:::::descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:' group-name ''
zstyle ':completion:' list-separator '⇒'
zstyle ':completion:' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Options
setopt prompt_subst autocd autopushd pushdignoredups histfindnodups histignorealldups histsavenodups
bindkey '^R' history-incremental-search-backward
bindkey '^B' vi-backward-word
bindkey '^N' vi-forward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

#python /opt/motivate/motivate.py

#PROMPT='%F{white}%B%3~%b%fy$(git_branch_name) %F{green}%{%1G✔%}%f '
#PROMPT='%F{cyan}%3~%f$(git_branch_name) %F{green}%{»%1G%}%f '
PROMPT='%F{cyan}%3~%f$(git_branch_name) %F{green}»%f '
path+='/home/alex/.cargo/bin/'
