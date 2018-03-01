export VISUAL=nvim
export EDITOR="$VISUAL"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"

typeset -U path
path=(/usr/local/bin
      $GOROOT/bin
      $GOPATH/bin
      $path)

alias ls="ls -G"
alias ll="ls -la"
alias vim="nvim"
