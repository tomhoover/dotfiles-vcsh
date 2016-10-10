#echo "zshenv"

path=(/usr/local/bin $path)
# start ssh-agent & load key
eval `keychain --eval id_rsa`

typeset -U path
path=(/usr/local/sbin $path ~/bin)

[ -r ~/.config/dotfiles/`uname`.zshenv ] && . ~/.config/dotfiles/`uname`.zshenv
[ -r ~/.config/dotfiles/`hostname -s`.zshenv ] && . ~/.config/dotfiles/`hostname -s`.zshenv
