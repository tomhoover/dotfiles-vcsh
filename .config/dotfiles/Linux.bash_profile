#echo "Linux.bash_profile"

# start ssh-agent & load key
[ `which keychain 2>/dev/null` ] && eval `keychain --quiet --ignore-missing --eval id_rsa github_rsa`

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux new -As default
fi

