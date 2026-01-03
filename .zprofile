export ZPROFILE_LOADED=1

MYHOST=$(uname -n | sed 's/\..*//')     # alternative to $(hostname -s), as arch does not install 'hostname' by default

[ -r ~/.profile ] && . ~/.profile

[ -r ~/.config/dotfiles/"$(uname)".zprofile ] && . ~/.config/dotfiles/"$(uname)".zprofile
[ -r ~/.config/dotfiles/"${MYHOST}".zprofile ] && . ~/.config/dotfiles/"${MYHOST}".zprofile
