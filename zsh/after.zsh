ghidoing() {
  if [[ "$1" = <-> ]]
  then
    ghi label "$1" -a "in progress"
    ghi assign $1 -u $(git config user.name)
    #git checkout -b "f-issue-$1"
  else
    ghi open -m "$1" -L "in progress" | xargs -0 bash -c 'for id; do git checkout -b "f-issue-$id"'
    ghi assign $1 -u $(git config --global user.name)
  fi
}

ghidone() {
  if [[ "$1" = <-> ]]
  then
    ghi close "$1"
    #git merge "f-issue-$1" develop
  else
    ghi close $(ghi open -m "$1" -L "in progress" | head -n 1 | awk 'match($0, /[0-9]+/){print substr($0, RSTART, RLENGTH)}')
    ghi assign $1 -u $(git config --global user.name)
    #git merge "f-issue-$1" develop
  fi
}

# aliases
alias find-ips="nmap -sP $(ipconfig getifaddr en0)/24"
alias e="emacsclient -tc"

#docker
alias dR="docker rmi $(docker images | grep "^<none>" | awk "{print $3}")"
alias di="docker images"
alias dps="docker ps"
alias dex="docker exec"
alias d="docker run"
alias dm="docker-machine"
alias dmi="dm ip"
alias dme="dm env"
alias dms="dm start && dme"
alias dmR="dm rm default"
alias dmc="dm create --driver virtualbox default"
alias dc="docker-compose"
alias dcu="dc up"
alias dck="dc kill"
alias dcR="dc rm -f"
alias dckR="dck && dcR"

#elixir
alias ni="npm install"
alias nib="ni && node node_modules/brunch/bin/brunch build"
alias ism="iex -S mix"
alias mdg="mix deps.get"
alias mpn="mix phoenix.new"
alias mps="mix phoenix.server"
alias ismps="iex -S mix phoenix.server"
alias mec="mix ecto.create"

export EDITOR="emacsclient -tc"
export SHELL=/usr/local/bin/zsh
export HOMEBREW_NO_ANALYTICS=1

#autoload -Uz promptinit
#promptinit
prompt sorin
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'