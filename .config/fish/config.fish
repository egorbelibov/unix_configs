# Other configs.
source ~/.config/fish/alias_list.fish

# Use Vim Keybidings.
fish_vi_key_bindings

# Required for GPG signing.
set -x GPG_TTY (tty)

# Make `doom` global
set -x PATH $HOME/.emacs.d/bin:$PATH

# ~/.config/fish/config.fish
starship init fish | source
