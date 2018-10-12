#Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"
if type base16_tomorrow-night > /dev/null; then
   base16_tomorrow-night
fi

# set PS1 with git if possible
if type __git_ps1 &> /dev/null ; then
  export PS1='\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]$(__git_ps1) \[\033[0m\]\n\$ \[$(tput sgr0)\]'
else
  export PS1='\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[0m\]\n\$ \[$(tput sgr0)\]'
fi

# added by Anaconda2 5.2.0 installer
export PATH="/Users/frank/anaconda2/bin:$PATH"

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

# ctrl+L set to clear screen
bind -m vi-insert "\C-l":clear-screen

