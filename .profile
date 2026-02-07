# shellcheck shell=sh

echo "$PATH" >>/tmp/shell-init.txt
echo "$(date '+%Y-%m-%d %H:%M') :: PROFILE_LOADED" >>/tmp/shell-init.txt
export PROFILE_LOADED=1

MYHOST=$(uname -n | sed -e 's/\..*//')     # alternative to $(hostname -s), as arch does not install 'hostname' by default

export PATH=/usr/local/bin:/usr/local/sbin:"$PATH"

# start ssh-agent & load key
command -v keychain >/dev/null 2>&1 && eval "$(keychain --quiet --ignore-missing --eval id_rsa_"${MYHOST}" github_rsa id_rsa)"

# add mise shims to PATH in .profile, instead of .bashrc and .zshrc
# this sets up non-interactive sessions
#   eval "$(mise activate bash --shims)"
# alternative to above eval command:
export PATH="$HOME/.local/share/mise/shims:$PATH"
