echo "$PATH" >> /tmp/shell-init.txt
echo "$(date '+%Y-%m-%d %H:%M') :: :: DARWIN_BASHRC_LOADED" >> /tmp/shell-init.txt
export DARWIN_ZSHRC_LOADED=1

# Solarized colorscheme for macOS `ls` environment variable:
# https://github.com/seebi/dircolors-solarized/issues/10
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

echo "$(date '+%Y-%m-%d %H:%M') :: :: DARWIN_BASHRC_ENDED" >> /tmp/shell-init.txt
