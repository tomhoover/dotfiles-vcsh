echo "$PATH" >> /tmp/shell-init.txt
echo "$(date '+%Y-%m-%d %H:%M') :: :: DARWIN_ZSHRC_LOADED" >> /tmp/shell-init.txt
export DARWIN_ZSHRC_LOADED=1

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
# ==> zsh-completions
# To activate these completions, add the following to your .zshrc:
#
#   if type brew &>/dev/null; then
#     FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
#
#     autoload -Uz compinit
#     compinit
#   fi
#
# You may also need to force rebuild `zcompdump`:
#
#   rm -f ~/.zcompdump; compinit
#
# Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
# to load these completions, you may need to run these commands:
#
#   chmod go-w '/opt/homebrew/share'
#   chmod -R go-w '/opt/homebrew/share/zsh'

# https://github.com/seebi/dircolors-solarized (so solarized colors are used when accessing machine with iTerm2/ssh)
#eval `dircolors $HOME/src/github.com/seebi/dircolors-solarized/dircolors.ansi-universal`
if [ -x /usr/bin/dircolors ]; then test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"; fi

# Solarized colorscheme for macOS `ls` environment variable:
# https://github.com/seebi/dircolors-solarized/issues/10
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# # https://github.com/Homebrew/homebrew-command-not-found
# HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
# if [ -f "$HB_CNF_HANDLER" ]; then source "$HB_CNF_HANDLER"; fi

# Homebrew
# To enable command-not-found
# Add the following lines to ~/.zshrc

HOMEBREW_COMMAND_NOT_FOUND_HANDLER="$(brew --repository)/Library/Homebrew/command-not-found/handler.sh"
if [ -f "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER" ]; then
  source "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER";
fi

# export PATH="$HOME/bin:$HOME/.local/share/mise/shims:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
# export PATH="$HOME/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

echo "$(date '+%Y-%m-%d %H:%M') :: :: DARWIN_ZSHRC_ENDED" >> /tmp/shell-init.txt
