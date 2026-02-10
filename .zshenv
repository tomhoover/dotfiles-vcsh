# shellcheck shell=bash
# shellcheck disable=SC1090

echo "$PATH" >>/tmp/shell-init.txt
echo "$(date '+%Y-%m-%d %H:%M') :: ZSHENV_LOADED" >>/tmp/shell-init.txt
export ZSHENV_LOADED=1

MYHOST=$(uname -n | sed -e 's/\..*//')     # alternative to $(hostname -s), as arch does not install 'hostname' by default

[ -r ~/.config/dotfiles/"$(uname)".zshenv ] && . ~/.config/dotfiles/"$(uname)".zshenv
[ -r ~/.config/dotfiles/"${MYHOST}".zshenv ] && . ~/.config/dotfiles/"${MYHOST}".zshenv
