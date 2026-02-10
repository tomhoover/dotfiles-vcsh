# shellcheck shell=bash
# shellcheck disable=SC1090

echo "$PATH" >>/tmp/shell-init.txt
echo "$(date '+%Y-%m-%d %H:%M') :: ZPROFILE_LOADED" >>/tmp/shell-init.txt
export ZPROFILE_LOADED=1

[ -r ~/.profile ] && emulate sh -c 'source ~/.profile'

[ -r ~/.config/dotfiles/"$(uname)".zprofile ] && . ~/.config/dotfiles/"$(uname)".zprofile
[ -r ~/.config/dotfiles/"${MYHOST}".zprofile ] && . ~/.config/dotfiles/"${MYHOST}".zprofile

echo "$PATH" >>/tmp/shell-init.txt
echo "$(date '+%Y-%m-%d %H:%M') :: ZPROFILE_ENDED" >>/tmp/shell-init.txt
