# echo " ***** .bashrc"

# keychain
# [ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
[ -r $HOME/.keychain/$HOSTNAME-sh ] && . $HOME/.keychain/$HOSTNAME-sh

# exit if non-interactive shell
[[ $- != *i* ]] && return

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,aliases,functions,extra,SECRETS}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

for file in ~/.config/dotfiles/`uname`.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

for file in ~/.config/dotfiles/`hostname -s`.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# rupa/z
[ -r ~/.local/share/z.sh ] && source ~/.local/share/z.sh

# ensure ~/.local/bin follows rbenv/pyenv shims in $PATH (i.e. pipx installed
#   packages are secondary to pyenv shims)
# path=(~/.local/bin $path)
export PATH=$HOME/.local/bin:$PATH

# rbenv
if command -v rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv: https://github.com/pyenv/pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv > /dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv > /dev/null; then eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"; fi
# pyenv-virtualenv: https://github.com/pyenv/pyenv-virtualenv
# if command -v pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# asdf: https://github.com/asdf-vm/asdf
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
. "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/bashrc"

# insert ~/bin in $PATH before rbenv/pyenv shims
# path=(~/bin $path)
export PATH=$HOME/bin:$PATH

# https://github.com/seebi/dircolors-solarized (so solarized colors are used when accessing machine with iTerm2/ssh)
#eval `dircolors $HOME/src/github.com/seebi/dircolors-solarized/dircolors.ansi-universal`
if [ -x /usr/bin/dircolors ]; then test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"; fi

# Solarized colorscheme for macOS `ls` environment variable:
# https://github.com/seebi/dircolors-solarized/issues/10
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# enable bash-completion to work with git aliases
# https://stackoverflow.com/questions/342969/how-do-i-get-bash-completion-to-work-with-aliases
__git_complete g __git_main

# direnv: https://direnv.net
if command -v direnv > /dev/null; then eval "$(direnv hook bash)"; fi

# fuzzy finder
# https://github.com/junegunn/fzf
[ -f ~/.config/dotfiles/fzf.bash ] && source ~/.config/dotfiles/fzf.bash

if command -v rg > /dev/null; then export FZF_DEFAULT_COMMAND='rg --files'; fi

[ -r ~/.config/dotfiles/`uname`.bashrc ] && . ~/.config/dotfiles/`uname`.bashrc
[ -r ~/.config/dotfiles/`hostname -s`.bashrc ] && . ~/.config/dotfiles/`hostname -s`.bashrc

# enable pipx completion
eval "$(register-python-argcomplete pipx)"

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/.local/share/liquidprompt
