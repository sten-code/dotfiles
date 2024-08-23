export ZSH="$HOME/.oh-my-zsh"
export VULKAN_SDK="$HOME/sdks/vulkan/1.3.290.0/x86_64"

ZSH_THEME="refined"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias cd="z"
alias pi="sudo pacman -S"
alias pu="sudo pacman -Sy"
alias ps="pacman -Ss"
alias la="ls -a"

if [ "$TMUX" = "" ]; then tmux; fi
neofetch
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
