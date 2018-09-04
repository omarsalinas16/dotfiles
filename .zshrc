# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/omar/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# General functions

function colors() {
  T='•••'   # The text for the color test
  
  echo -e "\n         def     40m     41m     42m     43m     44m     45m     46m     47m";
  
  for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
             '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
             '  36m' '1;36m' '  37m' '1;37m';
  
    do FG=${FGs// /}
    echo -en " $FGs \033[$FG  $T  "
    
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
      do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
    done
    echo;
  done
  echo
}

use_color=true

# Enable color support of ls
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Some aliases

alias l='ls -CF'
alias ls='ls -a --group-directories-first --color=auto -F'
alias ll='ls -l --group-directories-first --color=auto -F'
alias la='ls -la --group-directories-first --color=auto -F'

alias cl='clear'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -h'

alias free='free -m'

alias grep='grep --color=tty -d skip'

# Powerline

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
