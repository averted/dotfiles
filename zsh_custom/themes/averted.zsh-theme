git_custom_status() {
    precmd_update_git_vars
    if [ -n "$__CURRENT_GIT_STATUS" ]; then
      STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_BRANCH$GIT_BRANCH$GIT_UPSTREAM%{${reset_color}%}"

      # Add branch status prefix
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BRANCH_STATUS_PREFIX"

      if [ "$GIT_BEHIND" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BEHIND$GIT_BEHIND%{${reset_color}%}"
      fi
      if [ "$GIT_AHEAD" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD$GIT_AHEAD%{${reset_color}%}"
      fi

      # Add branch status suffix
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BRANCH_STATUS_SUFFIX"

      #STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"

      if [ "$GIT_STAGED" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED%{${reset_color}%}"
      fi
      # if [ "$GIT_CONFLICTS" -ne "0" ]; then
      #     STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS%{${reset_color}%}"
      # fi
      if [ "$GIT_CHANGED" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED%{${reset_color}%}"
      fi
      #if [ "$GIT_DELETED" -ne "0" ]; then
      #    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_DELETED$GIT_DELETED%{${reset_color}%}"
      #fi
      if [ "$GIT_UNTRACKED" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED$GIT_UNTRACKED%{${reset_color}%}"
      fi
      if [ "$GIT_STASHED" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STASHED$GIT_STASHED%{${reset_color}%}"
      fi
      #if [ "$GIT_CLEAN" -eq "1" ]; then
      #    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
      #fi
      STATUS="$STATUS%{${reset_color}%}$ZSH_THEME_GIT_PROMPT_SUFFIX%{$reset_color%} "
      echo "$STATUS"
    fi
}

#-----------------------------
PROMPT='%{$fg_bold[yellow]%}%n@%m%{$reset_color%} %{$fg_bold[blue]%}%2~%{$reset_color%} $(git_custom_status)%{$fg_bold[yellow]%}%{$SEPARATOR_SYMBOL%}%{$reset_color%} '
RPS1="${return_code}"
#-----------------------------

SEPARATOR_SYMBOL="≫"
#ZSH_THEME_GIT_SHOW_UPSTREAM=1
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH="%{$magenta%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[magenta]%})"
ZSH_THEME_GIT_PROMPT_BRANCH_STATUS_PREFIX="%{$fg[magenta]%}["
ZSH_THEME_GIT_PROMPT_BRANCH_STATUS_SUFFIX="%{$fg[magenta]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[red]%}%{-%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[yellow]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{◇%G%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{◈%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}%{…%G%}"
ZSH_THEME_GIT_PROMPT_STASHED="%F{240%}%{❖%G%}"

# Reference:
# Default github prompt vars: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git-prompt/git-prompt.plugin.zsh
