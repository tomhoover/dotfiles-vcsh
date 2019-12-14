#echo "Linux.bash_profile"

# start ssh-agent & load key
[ `which keychain 2>/dev/null` ] && eval `keychain --quiet --ignore-missing --eval id_rsa github_rsa`

# inspired by https://jpmens.net/2019/04/28/automatically-start-or-attach-tmux-in-ssh-session/
test -n "$SSH_TTY" && {
    TMUX_TMPDIR=$HOME/tmp
    export TMUX_TMPDIR
    test -d $TMUX_TMPDIR || mkdir -p $TMUX_TMPDIR
    command -v tmux &> /dev/null && test -z "$TMUX" -a -n "$SSH_CONNECTION" && exec tmux new -As default
}
