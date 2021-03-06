#!/bin/bash -x
#Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"
if type base16_tomorrow-night > /dev/null; then
   base16_tomorrow-night
fi

# set PS1 with git if possible
if type __git_ps1 &> /dev/null ; then
   export PS1='\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\] ($(__git_ps1)) \[\033[0m\]\n\$ \[$(tput sgr0)\]'
else
  alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/\* //'"
  export PS1='\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\] ${__git_ps1} \[\033[0m\]\n\$ \[$(tput sgr0)\]'
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
alias tmux='tmux -2'
alias tma='tmux attach -t'
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gitdir='cd ${GITDIR}'
alias novadir='cd ${NOVADIR}'
alias gitlog='git log --name-only'
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

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/frank/.kube/config:/Users/frank/.kube/config.shopify.cloudplatform
for file in /Users/frank/src/github.com/Shopify/cloudplatform/workflow-utils/*.bash; do source ${file}; done
kubectl-short-aliases
