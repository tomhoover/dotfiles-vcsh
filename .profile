# echo " ***** .profile"

export PATH=/usr/local/sbin:"$PATH"
MYHOST=$(uname -n | sed 's/\..*//')     # alternative to $(hostname -s), as arch does not install 'hostname' by default

[ -r /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"
[ -r /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# start ssh-agent & load key
command -v keychain >/dev/null 2>&1 && eval "$(keychain --quiet --ignore-missing --eval id_rsa_"${MYHOST}" github_rsa id_rsa)"
