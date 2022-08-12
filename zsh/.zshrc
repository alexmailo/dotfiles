#!/bin/zsh
autoload -Uz compinit &&compinit
_comp_options+=(globdots)

source $ZDOTDIR/aliases
source $ZDOTDIR/env
source $ZDOTDIR/functions
# source $ZDOTDIR/plugins/zsh-autosuggestions.zsh
# source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#
# ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
# ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'


HISTFILE="/home/alex/.config/zsh/history"
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory INC_APPEND_HISTORY  SHARE_HISTORY histsavenodups


zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $ZDOTDIR/.cache
zstyle ':completion:*' list-colors 'di=1;34'
zstyle ':completion:*' menu select
zstyle ':completion:*' file-sort modification
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-separator '⇒ '
zstyle ':completion:*' matcher-list  'm:{a-zA-Z}={A-Za-z}'
# zstyle ':completion:*' completer _complete _match _approximate

autoload -z edit-command-line
zle -N edit-command-line

setopt prompt_subst autocd autopushd pushdignoredups 
bindkey '^R' history-incremental-search-backward
bindkey '^B' vi-backward-word
bindkey '^N' vi-forward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey "^[." insert-last-word
bindkey '^X^E' edit-command-line

# PROMPT='%(?.%F{green} .%F{red} )%f %F{blue}%B%3~%b%f  '
PROMPT='%F{white}%B%3~%b%f %F{#ADDE2A}$(git_branch_name) %f'
