# echo " ***** .bash_profile"

[ -r ~/.profile ] && . ~/.profile

[ -r ~/.config/dotfiles/`uname`.bash_profile ] && . ~/.config/dotfiles/`uname`.bash_profile
[ -r ~/.config/dotfiles/`hostname -s`.bash_profile ] && . ~/.config/dotfiles/`hostname -s`.bash_profile

[ -r ~/.bashrc ] && . ~/.bashrc
