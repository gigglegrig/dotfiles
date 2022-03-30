source ~/.bashrc

if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi
if [ -e /Users/frank/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/frank/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
