# GOPATH
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/gocode/bin"
export GOPATH="$HOME/gocode"

# POSTGRES
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin"

# set .bash_history line limit
export HISTFILESIZE=
export HISTSIZE=25000

# LS alias
alias ..='cd ..'
alias ls='ls -laG'
alias c='clear'
alias cl='clear'
alias claer='clear'
alias celar='clear'
alias cealr='clear'
alias cealr='clear'

l() {
  if [[ $@ == "s-la" || $@ == "s-l" ]]; then
    command ls -la
  else
    command ls "$@"
  fi
}

# Dashboard aliases
alias ui="cd $HOME/pressly/ui-components"
alias dash="cd $HOME/pressly/dashboard/webapp/src/app"
alias press="cd $HOME/pressly/ng-pressilla/src/modules"
alias models="cd $HOME/pressly/dashboard/webapp/src/modules/app/models"

# Mobile App aliases
alias m-main="cd $HOME/pressly/mobile-app/app/scenes/Main"
alias m-compose="cd $HOME/pressly/mobile-app/app/scenes/Main/compose"

alias speedtest="curl http://speedtest.wdc01.softlayer.com/downloads/test10.zip > /dev/null"

# Git
alias gti="git"
alias gits="git s"

# LS Colors
export CLICOLOR=1
export LSCOLORS=exFxCxDxbxegedabagacab

# Deafult editor
export EDITOR=vim

# Responsive Prompt
parse_git_branch() {
  echo `__git_ps1 "%s"`
}

parse_remote_state() {
  remote_state=$(git status -sb 2> /dev/null | grep -oh "\[.*\]")
    echo $remote_state
}

prompt() {
  PS1="${GREEN}[$(parse_git_branch)$(parse_remote_state)]${COLOREND} \h:${BLUE}\W$ ${COLOREND}"
}

PROMPT_COMMAND=prompt

## Set some colours
BLACK="\[\e[0;30m\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
BLUE="\[\e[0;34m\]"
MAGENTA="\[\e[0;35m\]"
CYAN="\[\e[0;36m\]"
WHITE="\[\e[0;37m\]"
COLOREND="\[\e[00m\]"

# gitcompletion exports
export GIT_PS1_SHOWCOLORHINTS=1

# Disable autocompletion
complete -r
