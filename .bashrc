#############
# Variables #
#############
# make vim default
set -x BASH_SILENCE_DEPRECATION_WARNING 1
set -x VISUAL vim
set -x EDITOR "$VISUAL"
set -x CLICOLOR 1
# Add Visual Studio Code (code)
set -U fish_user_paths $fish_user_paths /usr/local/go/bin /usr/local/bin \
$HOME/.rvm/bin /Applications/Visual Studio Code.app/Contents/Resources/app/bin$HOME/.gem


###########
# Aliases #
###########
# enable colors
if uname -a | grep -q Darwin; then 
   #alias ls='ls -Glatr --block-size=M'
   alias ls='ls -Ga'
   set -x GITDIR /Users/frank/src/github.com/Shopify
   set -x NOVADIR $GITDIR/nova-deployment
else 
#   alias ls='ls -lart --color=always --block-size=M'
   alias ls='ls -a --color=always'
   set -x GITDIR ~/Github
   set -x NOVADIR $GITDIR/nova-deployment
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
set -x BASH_COMPLETION_COMPAT_DIR "/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# cloudplatform: add Shopify clusters to your local kubernetes config
set -x KUBECONFIG ${KUBECONFIG:+$KUBECONFIG:}/Users/xisun/.kube/config:/Users/xisun/.kube/config.shopify.cloudplatform
kubectl completion fish | source
