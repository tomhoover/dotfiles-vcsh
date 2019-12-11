#echo "Linux.zprofile"

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux new -As default
fi

