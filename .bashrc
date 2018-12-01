# exit if non-interactive shell
[[ $- != *i* ]] && return

#echo "bashrc"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,SECRETS}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

for file in ~/.config/dotfiles/`uname`.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

for file in ~/.config/dotfiles/`hostname -s`.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

[ -r ~/.config/dotfiles/`uname`.bashrc ] && . ~/.config/dotfiles/`uname`.bashrc
[ -r ~/.config/dotfiles/`hostname -s`.bashrc ] && . ~/.config/dotfiles/`hostname -s`.bashrc

#source `brew --prefix`/etc/profile.d/z.sh
source $HOME/src/github.com/rupa/z/z.sh

#source "$HOME/.homesick/repos/homeshick/homeshick.sh"
#homeshick --quiet refresh
#source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

# rbenv
if command -v rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv
if command -v pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if command -v pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/src/github.com/nojhan/liquidprompt/liquidprompt

# https://github.com/seebi/dircolors-solarized (so solarized colors are used when accessing machine with iTerm2/ssh)
#eval `dircolors $HOME/src/github.com/seebi/dircolors-solarized/dircolors.ansi-universal`
if [ -x /usr/bin/dircolors ]; then test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"; fi

# Solarized colorscheme for macOS `ls` environment variable:
# https://github.com/seebi/dircolors-solarized/issues/10
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# enable bash-completion to work with git aliases
# https://stackoverflow.com/questions/342969/how-do-i-get-bash-completion-to-work-with-aliases
__git_complete g __git_main
