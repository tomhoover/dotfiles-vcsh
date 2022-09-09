# echo " ***** Darwin.zshrc"

fpath=($HOME/.zsh/completions /usr/local/share/zsh/site-functions $fpath)
# zsh completion is not working -- https://github.com/andsens/homeshick/issues/89
#compinit
# sudo -s gives "insecure directories and files" error -- https://github.com/Homebrew/homebrew/issues/7801
#compinit -u
autoload -U compinit && compinit

# https://github.com/seebi/dircolors-solarized (so solarized colors are used when accessing machine with iTerm2/ssh)
#eval `dircolors $HOME/src/github.com/seebi/dircolors-solarized/dircolors.ansi-universal`
if [ -x /usr/bin/dircolors ]; then test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"; fi

# Solarized colorscheme for macOS `ls` environment variable:
# https://github.com/seebi/dircolors-solarized/issues/10
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# fuzzy finder
# https://github.com/junegunn/fzf
[ -f ~/.config/dotfiles/fzf.zsh ] && source ~/.config/dotfiles/fzf.zsh
