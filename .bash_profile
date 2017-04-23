#echo "bash_profile"

PATH=/usr/local/sbin:$PATH:$HOME/bin:$HOME/.local/bin

[ -r ~/.config/dotfiles/`uname`.bash_profile ] && . ~/.config/dotfiles/`uname`.bash_profile
[ -r ~/.config/dotfiles/`hostname -s`.bash_profile ] && . ~/.config/dotfiles/`hostname -s`.bash_profile
#[ -r ~/.profile ] && . ~/.profile
[ -r ~/.bashrc ] && . ~/.bashrc
