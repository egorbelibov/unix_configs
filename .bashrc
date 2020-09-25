export GPG_TTY=$(tty)

export HISTFILE=~/.bash_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
