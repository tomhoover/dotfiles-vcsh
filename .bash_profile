#echo "bash_profile"

#PATH=$HOME/git-annex.linux:/usr/local/sbin:$PATH:$HOME/bin:$HOME/.local/bin
PATH=/usr/local/sbin:$PATH:$HOME/bin:$HOME/.local/bin

[ -r ~/.config/dotfiles/`uname`.bash_profile ] && . ~/.config/dotfiles/`uname`.bash_profile
[ -r ~/.config/dotfiles/`hostname -s`.bash_profile ] && . ~/.config/dotfiles/`hostname -s`.bash_profile
#[ -r ~/.profile ] && . ~/.profile
if [ -z "$TMUX" ]; then
    tmux new -As default
fi
[ -r ~/.bashrc ] && . ~/.bashrc
