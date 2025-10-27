# suppress Catalina default zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

#---------------
# Path
#---------------
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="$PATH:$HOME/scripts/bin"

# Python (needed for powerline)
export PATH="$PATH:$HOME/Library/Python/3.9/bin"

# Cargo
export PATH="$PATH:$HOME/.cargo/bin"
. "$HOME/.cargo/env"

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Java SDK (for RN Android dev)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Postgress
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# MySQL
# export PATH="$PATH:/usr/local/mysql/bin"

#---------------
# Settings
#---------------
LS_DEFAULT_ARGS="-lahG --color"

# git completion exports
export GIT_PS1_SHOWCOLORHINTS=1

# git Disable autocompletion
complete -r

# set .bash_history line limit
export HISTFILESIZE=
export HISTSIZE=25000

# Default editor
export EDITOR=vim

# General aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias xa='xargs'
alias ls='ls $LS_DEFAULT_ARGS'
alias c='clear'
alias cl='clear'
alias claer='clear'
alias celar='clear'
alias cealr='clear'
alias cealr='clear'
alias scripts="cd $HOME/scripts"
alias tark="cd $HOME/git/tarkov/src"
alias ts="cd $HOME/git/tarkov-server"
alias notes="soup-rs"

# Rust
alias rust="cd $HOME/git/rust"

cargo() {
    if [ "$1" = "doc" ]; then
      if [ -z "$2" ]; then
        command cargo doc --no-deps --open
      else
        command cargo "$@"
      fi
    else
        command cargo "$@"
    fi
}

# Grep (OBSOLETE)
export GREP_COLOR="91"
alias grep='grep --color=always --exclude-dir={node_modules,.jest-cache,.build,target}'

# RipGrep
export RIPGREP_CONFIG_PATH=~/git/dotfiles/.ripgreprc

# Git
alias gs="git status"
alias gd="git diff"
alias gp="git pull"
alias gti="git"
alias gits="git s"
alias gtis="git s"

# Docker
alias d="docker"

function dc() {
  container=$@
  command docker exec -it $container /bin/bash
}

# npm
alias npm-list="npm list -g --depth=0"
alias npm-dated="sudo npm outdated -g --depth=0"

start() {
  if [ ! -f ./package.json ]; then
    echo "[Error] Could not locate file: package.json"
  else
    npm run start $@
  fi
}

# Other
alias jasmine="jasmine-node --autotest --color"
alias md="msee"
alias sleep="pmset sleepnow"
alias away="pmset sleepnow"
alias off="pmset sleepnow"

# LS alias
function l() {
  if [[ $@ == "s-la" || $@ == "s-al" || $@ == "s-l" ]]; then
    command ls $LS_DEFAULT_ARGS
  else
    command ls "$@"
  fi
}

function ls() {
  if [[ $@ == "$LS_DEFAULT_ARGS a-l" ]]; then
    command ls $LS_DEFAULT_ARGS
  else
    command ls "$@"
  fi
}

# LS Colors
export CLICOLOR=1
export LSCOLORS=exFxCxDxbxegedabagacab

##
# CD alias
# Move into files directory if known extension
##
function cd() {
  string=$@

  if [[
    ${string: -3} == ".rs" ||
    ${string: -3} == ".js" ||
    ${string: -3} == ".ts" ||
    ${string: -4} == ".jsx" ||
    ${string: -4} == ".tsx" ||
    ${string: -4} == ".css" ||
    ${string: -5} == ".styl" ||
    ${string: -5} == ".html"
  ]]; then
    command cd "$(dirname $string)"
  else
    command cd "$@"
  fi
}

# Encryption
encrypt() {
  command openssl enc -aes-256-cbc -salt -in $1 -out $2
}

decrypt() {
  command openssl enc -d -aes-256-cbc -in $1 -out $2
}

#---------------
# Prompt (old)
#---------------
# BLACK="\[\e[0;30m\]"
# RED="\[\e[0;31m\]"
# GREEN="\[\e[0;32m\]"
# YELLOW="\[\e[0;33m\]"
# BLUE="\[\e[0;34m\]"
# MAGENTA="\[\e[0;35m\]"
# CYAN="\[\e[0;36m\]"
# WHITE="\[\e[0;37m\]"
# COLOREND="\[\e[00m\]"
#
# parse_git_branch() {
#   echo `__git_ps1 "%s"`
# }
#
# parse_remote_state() {
#   remote_state=$(git status -sb 2> /dev/null | grep -oh "\[.*\]")
#     echo $remote_state
# }
#
# prompt() {
#   PS1="${GREEN}[$(parse_git_branch)$(parse_remote_state)]${COLOREND} \h:${BLUE}\W$ ${COLOREND}"
# }
#
# PROMPT_COMMAND=prompt

#---------------
# Prompt
#---------------
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /Users/av/Library/Python/3.9/lib/python/site-packages/powerline/bindings/bash/powerline.sh

