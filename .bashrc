# exit if non-interactive shell
[[ $- != *i* ]] && return

#echo "bashrc"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
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
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/src/github.com/nojhan/liquidprompt/liquidprompt
