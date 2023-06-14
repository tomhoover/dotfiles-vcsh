# echo " ***** .zshenv"

MYHOST=$(uname -n | sed 's/\..*//')     # alternative to $(hostname -s), as arch does not install 'hostname' by default

typeset -U path

[ -r ~/.config/dotfiles/"$(uname)".zshenv ] && . ~/.config/dotfiles/"$(uname)".zshenv
[ -r ~/.config/dotfiles/"${MYHOST}".zshenv ] && . ~/.config/dotfiles/"${MYHOST}".zshenv
