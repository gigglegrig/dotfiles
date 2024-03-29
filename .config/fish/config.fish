# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

function code
  set location "$PWD/$argv"
  open -n -b "com.microsoft.VSCode" --args $location
end

#############
# Variables #
#############
# make vim default
set -x BASH_SILENCE_DEPRECATION_WARNING 1
set -x VISUAL vim
set -x EDITOR "$VISUAL"
set -x CLICOLOR 1
# Add Visual Studio Code (code)
set -U fish_user_paths $fish_user_paths /opt/homebrew/bin/ /usr/local/go/bin /usr/local/bin \
$HOME/.rvm/bin /Applications/Visual Studio Code.app/Contents/Resources/app/bin$HOME/.gem
set -gx PATH /opt/homebrew/bin/ $PATH
set -x GOROOT /opt/homebrew/bin/go
set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set -gx PATH $PATH $GOROOT $GOPATH $GOBIN $PATH
###########
# Aliases #
###########
# enable colors
#alias ls='ls -Glatr --block-size=M'
alias ls='ls -Ga'
set -x GITDIR /Users/franksun/stripe
set -x NOVADIR $GITDIR/nova-deployment
###########
alias vi=vim
alias typora="open -a typora"
alias tmux='tmux -2'
alias tma='tmux attach -t'
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gitdir='cd $GITDIR'
alias novadir='cd $NOVADIR'
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
alias aws='sc-aws'
alias wbj="work begin -j"
alias wbs="work pr show"
alias wbr="work review"
alias tc='/usr/local/stripe/bin/test_cookbook'
alias cz='/usr/local/stripe/bin/chef-zero'
alias cookit='tc && cz'

fish_vi_key_bindings

if test -f /opt/dev/dev.fish
  source /opt/dev/dev.fish
end

kubectl completion fish | source
. ~/stripe/space-commander/bin/sc-env-activate.fish


set -gx PATH /Users/franksun/stripe/work/exe $PATH
set -e GOROOT
