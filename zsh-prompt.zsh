#!/bin/zsh

_zsh_set_prompt() {
  # Find and set branch name var if in git repository.
  function git_branch_name()
  {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]];
    then
      :
    else
      echo '- %F{blue}'$branch'%f'
    fi
  }

  # Enable substitution in the prompt.
  setopt prompt_subst

  # set prompt.
  PROMPT='%(?.%F{green}:).%F{red}:()%f %B%F{240}%1~%f%b $(git_branch_name) %# '
}

_zsh_set_prompt