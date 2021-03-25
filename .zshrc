# Starship
eval "$(starship init zsh)"

# Source Aliases
source ~/.aliases

# GPG Daemon
export GPG_TTY=$(tty)

# Set-up $PATH
PATH=/usr/bin:/bin:/usr/sbin:/sbin
# add custom, local installations to PATH
PATH=/usr/local/bin:/usr/local/sbin:"$PATH"
# add MacPorts to PATH
PATH=/opt/local/bin:/opt/local/sbin:"$PATH"
# other
PATH="$HOME/.emacs.d/bin:$PATH"
export PATH

# Vim Mode (ZSH)
bindkey -v
