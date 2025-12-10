# Oh My Zsh path
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=$HOME/git/dotfiles/zsh_custom

# Theme
ZSH_THEME="averted"

# Plugins
plugins=(git-prompt)

# Options
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_expire_dups_first
setopt nocaseglob
setopt nocasematch

# Init
source $ZSH/oh-my-zsh.sh
export EDITOR='vim'

# Aliases
LS_DEFAULT_ARGS="-lahG"
alias ls='ls $LS_DEFAULT_ARGS'
alias c='clear'
alias cl='clear'
alias claer='clear'
alias celar='clear'
alias cealr='clear'
alias cealr='clear'
alias scripts="cd $HOME/scripts"
alias notes="soup-rs"
alias d="docker"
alias rust="cd $HOME/git/rust"

alias jasmine="jasmine-node --autotest --color"
alias md="msee"
alias sleep="pmset sleepnow"
alias away="pmset sleepnow"
alias off="pmset sleepnow"

# Obsolete?
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
