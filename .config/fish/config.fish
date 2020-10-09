# Other configs.
source ~/.config/fish/alias_list.fish

# Use Vim Keybidings.
fish_vi_key_bindings

# Required for GPG signing.
set -x GPG_TTY (tty)

# Do not store commands that start with a space
set HISTCONTROL ignorespace

# Make 'doom' global
set PATH $HOME/.emacs.d/bin:$PATH

# ~/.config/fish/config.fish
starship init fish | source
