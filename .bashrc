#!/bin/bash -x
#Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"
#if type base16_tomorrow-night > /dev/null; then
#   base16_tomorrow-night
#fi

source ~/git-completion.bash
source ~/git-prompt.sh

# set PS1 with git if possible
if type __git_ps1 &> /dev/null ; then
   export PS1='\[\033[32m\][\D{%H:%M:%S}] \u@\h \[\033[33m\]\w\[\033[36m\]$(__git_ps1)\[\033[0m\]\n\$ \[$(tput sgr0)\]'
else
  alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/\* //'"
  export PS1='\[\033[32m\][\D{%H:%M:%S}] \u@\h \[\033[33m\]\w\[\033[36m\] ${__git_ps1} \[\033[0m\]\n\$ \[$(tput sgr0)\]'
fi

# set git auto completion
if [ -f ~/git-completion.bash ]; then
   source ~/git-completion.bash
fi

# start ssh-agent
if ! ssh-add -L >& /dev/null; then
     eval `ssh-agent -s` >& /dev/null
       ssh-add >& /dev/null
fi

# add ssh identity
if [[ -r ~/.ssh/id_rsa ]]; then
   ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
fi

# added by Anaconda2 5.2.0 installer
export PATH="/Users/frank/anaconda2/bin:$PATH"

#############
# Variables #
#############
# make vim default
export BASH_SILENCE_DEPRECATION_WARNING=1
export VISUAL=vim
export EDITOR="$VISUAL"
export CLICOLOR=1
export PATH=~/.bin:${PATH}:/usr/local/go/bin
export PATH="/usr/local/bin:$PATH"
export TERM=xterm-256color
# Add Visual Studio Code (code)
export GEM_HOME="$HOME/.gem"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
###########
# Aliases #
###########
# enable colors
if uname -a | grep -q Darwin; then 
   #alias ls='ls -Glatr --block-size=M'
   alias ls='ls -Ga'
   export GITDIR=/Users/frank/src/github.com/Shopify
   export NOVADIR=$GITDIR/nova-deployment
else 
#   alias ls='ls -lart --color=always --block-size=M'
   alias ls='ls -a --color=always'
   export GITDIR=~/Github
   export NOVADIR=$GITDIR/nova-deployment
fi 

###########
alias vi=vim
alias typora="open -a typora"
alias tmux='tmux -2'
alias tma='tmux attach -t'
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gitdir='cd ${GITDIR}'
alias novadir='cd ${NOVADIR}'
alias gitlog='git log --name-only'
alias k='kubectl';
alias kbn='browse-nodes';
alias kbp='browse-running-pods';
alias kdesc='k describe $(k get pods -o name | fzf)';
alias kex='exec-with-bash-if-available $(list-running-containers-by-pod | fzf)';
alias kg='k get';
alias kgn='k get namespaces';
alias kgp='k get pods';
alias kgpn='k get pods -o custom-columns=NAME:.metadata.name --no-headers';
alias kl='list-running-containers-by-pod | fzf --preview "kubectl logs {1} {2}" --height=100%';
alias kx='exec-pod';
alias rdst1c1='k --context "redis-tier1-us-central1-1" --namespace shopify-core';
alias rdst1e1='k --context "redis-tier1-us-east1-1" --namespace shopify-core'
alias t1ne13='k --context "tier1-na-ne1-3"';

# vanilla tmux
function ton {
   ssh $1 -t "tmux attach || tmux new"
}

function aon {
   ssh $1 -t "tmux a -t $2"
}

# for iTerm2 Tmux integration
function con {
    ssh $1 -t "tmux -CC attach || tmux -CC";
}

function newcon {
    ssh $1 -t "tmux -CC new -s $2";
}

function attcon {
    ssh $1 -t "tmux -CC a -t  $2"
}

function cd {
   builtin cd "$@" && ls -F
}

set -o vi

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi


[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }
# bash completion
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
