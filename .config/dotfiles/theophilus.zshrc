# echo " ***** theophilus.zshrc"

# fuzzy finder
# https://github.com/junegunn/fzf
# [ -f ~/.config/dotfiles/fzf.zsh ] && source ~/.config/dotfiles/fzf.zsh
. /usr/share/fzf/key-bindings.zsh
. /usr/share/fzf/completion.zsh

# Try this to fuzzy-search through all available packages, with package info shown in a preview window, and then install selected packages:
alias pmsearch="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"

# If you want to add package file list in preview - may be a bit slower updating preview window (make sure you run pacman -Fy at least once before invocation to sync the pacman file database):
# alias pmfiles="pacman -Slq | fzf --multi --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk "{print \$2}")' | xargs -ro sudo pacman -S"
