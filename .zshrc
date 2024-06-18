export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="refined"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias cd="z"
alias pi="sudo pacman -Sy "
alias ps="pacman -Ss "
alias la="ls -a"

if [ "$TMUX" = "" ]; then tmux; fi
neofetch
eval "$(zoxide init zsh)"
