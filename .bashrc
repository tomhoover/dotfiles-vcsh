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

[ -r ~/.config/dotfiles/`uname`.bashrc ] && . ~/.config/dotfiles/`uname`.bashrc
[ -r ~/.config/dotfiles/`hostname -s`.bashrc ] && . ~/.config/dotfiles/`hostname -s`.bashrc

# rupa/z
[ -r ~/.local/share/z.sh ] && source ~/.local/share/z.sh

# rbenv
if command -v rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv: https://github.com/pyenv/pyenv
if command -v pyenv > /dev/null; then 
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# pyenv-virtualenv: https://github.com/pyenv/pyenv-virtualenv
if command -v pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# direnv: https://direnv.net
if command -v direnv > /dev/null; then eval "$(direnv hook bash)"; fi

# insert ~/bin and ~/.local/bin before rbenv/pyenv shims
# path=(~/bin ~/.local/bin $path)
export PATH=$HOME/bin:$HOME/.local/bin:$PATH

# https://github.com/seebi/dircolors-solarized (so solarized colors are used when accessing machine with iTerm2/ssh)
#eval `dircolors $HOME/src/github.com/seebi/dircolors-solarized/dircolors.ansi-universal`
if [ -x /usr/bin/dircolors ]; then test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"; fi

# Solarized colorscheme for macOS `ls` environment variable:
# https://github.com/seebi/dircolors-solarized/issues/10
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# enable bash-completion to work with git aliases
# https://stackoverflow.com/questions/342969/how-do-i-get-bash-completion-to-work-with-aliases
__git_complete g __git_main

# fuzzy finder
# https://github.com/junegunn/fzf
[ -f ~/.config/dotfiles/fzf.bash ] && source ~/.config/dotfiles/fzf.bash

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/.local/share/liquidprompt
