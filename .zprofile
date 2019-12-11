#echo ".zprofile"

[ -r ~/.config/dotfiles/`uname`.zprofile ] && . ~/.config/dotfiles/`uname`.zprofile
[ -r ~/.config/dotfiles/`hostname -s`.zprofile ] && . ~/.config/dotfiles/`hostname -s`.zprofile

