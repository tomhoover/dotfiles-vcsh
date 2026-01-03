# shellcheck source=/dev/null
export PROFILE_LOADED=1

export PATH=/usr/local/sbin:"$PATH"
MYHOST=$(uname -n | sed 's/\..*//')     # alternative to $(hostname -s), as arch does not install 'hostname' by default

[ -r /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"
[ -r /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/.{exports,extra,SECRETS}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

for file in ~/.config/dotfiles/$(uname).{exports,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

for file in ~/.config/dotfiles/${MYHOST}.{exports,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# start ssh-agent & load key
command -v keychain >/dev/null 2>&1 && eval "$(keychain --quiet --ignore-missing --eval id_rsa_"${MYHOST}" github_rsa id_rsa)"

# add mise shims to PATH in .profile, instead of .bashrc and .zshrc
# this sets up non-interactive sessions
#   eval "$(mise activate bash --shims)"
# alternative to above eval command:
export PATH="$HOME/.local/share/mise/shims:$PATH"
