# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/omar/.zshrc'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

setopt MENU_COMPLETE
setopt AUTO_CD

autoload -Uz compinit
compinit
# End of lines added by compinstall

# General functions

# colors - display terminal colors
# usage: colors
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

# ex - archive extractor
# usage: ex <file>
function ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

use_color=true

# Enable color support of ls
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Some aliases

# cd aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias /='cd /'
alias ~='cd ~'

# ls aliases
alias ls='ls --group-directories-first --color=auto -F'
alias ll='ls -lh --group-directories-first --color=auto -F'
alias la='ls -lAh --group-directories-first --color=auto -F'

# terminal operations aliases
alias cl='clear'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias df='df -h'
alias md='mkdir -p'
alias rd='rm -rf -i'

# other tools aliases
alias ci='code-insiders'
alias py='python'
alias free='free -m'
alias grep='grep --color=tty -d skip'

# git aliases
alias gi='git init'
alias gra='git remote add'
alias grr='git remote remove'
alias ga='git add'
alias gaf='git add -f'
alias gaa='git add --all'
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gd='git diff'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gl='git pull'
alias gp='git push'
alias gs='git status'
alias gss='git status -s'
alias gtree='git log --oneline --graph --color --all --decorate'

# powerline
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
