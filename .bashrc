# PATH
export PATH="/usr/local/bin:$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/usr/local/go/bin" # Add go to PATH

# GOPATH
export PATH="$PATH:$HOME/gocode/bin" # Add go to PATH
export GOPATH="$HOME/gocode" # Add GOPATH

# set .bash_history line limit
export HISTFILESIZE=
export HISTSIZE=25000

# LS alias
alias ls='ls -G'
alias celar='clear'
alias cealr='clear'

# Dashboard aliases
alias modules='cd /Users/averted/pressly/pressly-dashboard/webapp/src/modules'
alias model='cd /Users/averted/pressly/pressly-dashboard/webapp/src/modules/app/models'
alias app='cd /Users/averted/pressly/pressly-dashboard/webapp/src/app'

# LS Colors
export CLICOLOR=1
export LSCOLORS=exFxCxDxbxegedabagacab

# Deafult editor
export EDITOR=vim

# Find bash completion directory
bash=${BASH_VERSION%.*}; bmajor=${bash%.*}
if [[ $bmajor -gt 2 ]]; then
  if hash brew 2>/dev/null; then
    export BASH_COMPLETION_DIR=$(brew --prefix)/etc/bash_completion.d
    . $(brew --prefix)/etc/bash_completion
  else
    if [[ -f /etc/bash_completion ]]; then
      if [[ -z "$BASH_COMPLETION" ]]; then
        BASH_COMPLETION=/etc/bash_completion
        export BASH_COMPLETION
      fi
      if [[ -z "$BASH_COMPLETION_DIR" ]]; then
        BASH_COMPLETION_DIR=/etc/.bash_completion.d
        export BASH_COMPLETION_DIR
      fi
      . /etc/bash_completion
    fi
  fi
  unset bash bmajor
fi

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
