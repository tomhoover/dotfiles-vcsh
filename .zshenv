#echo "zshenv"

path=(/opt/homebrew/bin /usr/local/bin $path)
# start ssh-agent & load key
type keychain &>/dev/null && eval `keychain --quiet --ignore-missing --eval id_rsa`

typeset -U path
path=(/usr/local/sbin:/usr/sbin:/sbin $path)

[ -r ~/.config/dotfiles/`uname`.zshenv ] && . ~/.config/dotfiles/`uname`.zshenv
[ -r ~/.config/dotfiles/`hostname -s`.zshenv ] && . ~/.config/dotfiles/`hostname -s`.zshenv
