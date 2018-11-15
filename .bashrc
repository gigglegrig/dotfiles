#Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"

# set PS1 with git if possible
if type __git_ps1 &> /dev/null ; then
  export PS1='\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\] $(__git_ps1) \[\033[0m\]\n\$ \[$(tput sgr0)\]'
else
  alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/\* //'"
  export PS1='\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\] ($(__git_ps1)) \[\033[0m\]\n\$ \[$(tput sgr0)\]'
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
export VISUAL=vim
export EDITOR="$VISUAL"
export CLICOLOR=1
export PATH=~/.bin:${PATH}

###########
# Aliases #
###########
# enable colors
if uname -a | grep -q Darwin; then 
   alias ls='ls -G'
else 
   alias ls='ls --color=always'
fi 

function con {
    ssh $1 -t "tmux -CC attach || tmux -CC";
}

function newcon {
    ssh $1 -t "tmux -CC new -s $2";
}

function attcon {
    ssh $1 -t "tmux -CC a -t  $2"
}

set -o vi

alias vi=vim
function cd {
   builtin cd "$@" && ls -F
}

