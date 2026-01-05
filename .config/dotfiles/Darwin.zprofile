export DARWIN_ZPROFILE_LOADED=1

[ -r /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"
[ -r /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
