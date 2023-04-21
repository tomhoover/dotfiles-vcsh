# echo " ***** .profile"

export PATH=/usr/local/sbin:$PATH

[ -r /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"
[ -r /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# start ssh-agent & load key
[ `which keychain 2>/dev/null` ] && eval $(keychain --quiet --ignore-missing --eval id_rsa_$(hostname -s) github_rsa id_rsa)
# type keychain &>/dev/null && eval $(keychain --quiet --ignore-missing --eval id_rsa github_rsa)
