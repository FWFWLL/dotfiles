#!/bin/sh

# History
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef
zle_highlight=("paste:none")

# Beeping is annoying
unsetopt BEEP

# Remove suspending
set +m

# Key bindings
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

# Remove bindings
bindkey -r "^H"
bindkey -r "^J"
bindkey -r "^K"
bindkey -r "^L"

# Completion
autoload -Uz compinit && compinit
zstyle ":completion:*" matcher-list "" "m:{a-zA-z}={A-Za-z}"
zstyle ":completion:*" menu select
zstyle ":completion::complete:*" gain-privileges 1
zmodload zsh/complist

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Alias
alias cls="clear"
alias ls="exa -lBa --icons --group-directories-first --no-user --no-time"
alias nv="nvim"
alias vim="nvim"
alias v="nvim"
alias ..="cd .."
alias reload="source $ZDOTDIR/.zshrc"

# Zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Source Node Version Manager
source /usr/share/nvm/init-nvm.sh

# Initialize Starship
eval "$(starship init zsh)"

[ -f "/home/ffl/.ghcup/env" ] && source "/home/ffl/.ghcup/env" # ghcup-env

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
