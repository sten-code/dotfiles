export ZSH="$HOME/.oh-my-zsh"
export VULKAN_SDK="$HOME/sdks/vulkan/1.3.290.0/x86_64"
export EDITOR="nvim"

# Setup Oh-My-Zsh
ZSH_THEME="refined"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Aliases
alias cd="z"
alias pi="sudo pacman -S"
alias pu="sudo pacman -Sy"
alias ps="pacman -Ss"
alias la="ls -a"

# Attach to an existing tmux session
if [ "$TMUX" = "" ]; then tmux a; fi

# yazi cwd command
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function cloc() {
    if [[ -f .clocignore ]]; then
        command cloc --exclude-list-file=.clocignore "$@"
    else
        command cloc "$@"
    fi
}

# Initialize zoxide for zsh
eval "$(zoxide init zsh)"

# python version manager
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
