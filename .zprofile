#echo "zprofile"

[ -r ~/.config/dotfiles/`uname`.zprofile ] && . ~/.config/dotfiles/`uname`.zprofile
[ -r ~/.config/dotfiles/`hostname -s`.zprofile ] && . ~/.config/dotfiles/`hostname -s`.zprofile
if [ -z "$TMUX" ]; then
    tmux new -As default
fi
