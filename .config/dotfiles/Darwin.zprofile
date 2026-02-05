echo "$PATH" >> /tmp/shell-init.txt
echo "$(date '+%Y-%m-%d %H:%M') :: :: DARWIN_ZPROFILE_LOADED" >> /tmp/shell-init.txt
export DARWIN_ZPROFILE_LOADED=1

[ -r /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv zsh)"
[ -r /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

echo "$(date '+%Y-%m-%d %H:%M') :: :: DARWIN_ZPROFILE_ENDED" >> /tmp/shell-init.txt
