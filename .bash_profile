# shellcheck source=/dev/null
echo "$PATH" >> /tmp/shell-init.txt
echo "$(date '+%Y-%m-%d %H:%M') :: BASH_PROFILE_LOADED" >> /tmp/shell-init.txt
export BASH_PROFILE_LOADED=1

# MYHOST=$(uname -n | sed 's/\..*//')     # alternative to $(hostname -s), as arch does not install 'hostname' by default
[ -r ~/.profile ] && . ~/.profile

[ -r ~/.config/dotfiles/"$(uname)".bash_profile ] && . ~/.config/dotfiles/"$(uname)".bash_profile
[ -r ~/.config/dotfiles/"${MYHOST}".bash_profile ] && . ~/.config/dotfiles/"${MYHOST}".bash_profile

[ -r ~/.bashrc ] && . ~/.bashrc
