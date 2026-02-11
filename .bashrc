# shellcheck shell=bash
# shellcheck disable=SC1090

echo "$PATH" >>/tmp/shell-init.txt
echo "$(date '+%Y-%m-%d %H:%M') :: BASHRC_LOADED" >>/tmp/shell-init.txt
export BASHRC_LOADED=1

# exit if non-interactive shell
[[ $- != *i* ]] && return

# # keychain
# [ -r "$HOME"/.keychain/"$(uname -n)"-sh ] && source "$HOME"/.keychain/"$(uname -n)"-sh

# SHEL=$(basename $SHELL)
SHEL=bash
source ~/.config/dotfiles/init

MYHOST=$(uname -n | sed -e 's/\..*//') # alternative to $(hostname -s), as arch does not install 'hostname' by default

[ -r ~/.config/dotfiles/"$(uname)".bashrc ] && source ~/.config/dotfiles/"$(uname)".bashrc
[ -r ~/.config/dotfiles/"${MYHOST}".bashrc ] && source ~/.config/dotfiles/"${MYHOST}".bashrc

# ----------

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768'
export HISTFILESIZE="${HISTSIZE}"
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth'

# https://github.com/seebi/dircolors-solarized (so solarized colors are used when accessing machine with iTerm2/ssh)
#eval $(dircolors $HOME/src/github.com/seebi/dircolors-solarized/dircolors.ansi-universal)
# shellcheck disable=SC2015
if [ -x /usr/bin/dircolors ]; then test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"; fi

# enable bash-completion to work with git aliases
# https://stackoverflow.com/questions/342969/how-do-i-get-bash-completion-to-work-with-aliases
#TODO
#__git_complete g __git_main
#TODO
# https://github.com/cykerway/complete-alias ??

# ----------

# Use starship prompt if available, otherwise liquidprompt
if command -v starship &>/dev/null; then
  # prevent empty line when opening terminal (https://github.com/starship/starship/issues/560)
  #   used in conjunction with 'add_newline = false' in ~/.config/starship.toml
  PROMPT_NEEDS_NEWLINE=false
  my_precmd() {
    if [[ "$PROMPT_NEEDS_NEWLINE" == true ]]; then
      echo
    fi
    PROMPT_NEEDS_NEWLINE=true
  }
  clear() {
    PROMPT_NEEDS_NEWLINE=false
    command clear
  }
  # export PROMPT_COMMAND=my_precmd
  starship_precmd_user_func=my_precmd

  # shellcheck disable=SC2086
  eval "$(starship init ${SHEL})"
else
  [ -f ~/.local/share/liquidprompt ] && source ~/.local/share/liquidprompt
fi
