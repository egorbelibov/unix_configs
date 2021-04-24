# Starship
eval "$(starship init zsh)"

# Source Aliases
source ~/.aliases

# GPG Daemon
export GPG_TTY=$(tty)

# Vim Mode (ZSH)
bindkey -v

# Set-up $PATH
PATH=/usr/bin:/bin:/usr/sbin:/sbin
# add custom, local installations to PATH
PATH=/usr/local/bin:/usr/local/sbin:"$PATH"
# add MacPorts to PATH
PATH=/opt/local/bin:/opt/local/sbin:"$PATH"
# Haskell Binaries
PATH="$HOME/.local/bin:$PATH"
# other
PATH="$HOME/.emacs.d/bin:$PATH"
export PATH

# ghcup-env
[ -f "/Users/65676f72/.ghcup/env" ] && source "/Users/65676f72/.ghcup/env"
