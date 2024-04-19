# dotfiles

My dotfiles for Arch Linux

## Requirements

```bash
pacman -S git stow btop dunst hyprland kitty waybar wofi zsh curl udiskie grim slurp wl-clipboard thunar zoxide
yay -S wlogout swaylock-effects swww
```

## Installation

I'm using stow to create symlinks to the actual dotfiles, this allows for easier dotfile management.

```bash
git clone https://github.com/sten-code/dotfiles ~/dotfiles
cd ~/dotfiles
stow .
```

### Zsh

I use zsh as my shell with oh-my-zsh

```bash
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions into oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting into oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Change the default shell
chsh -s $(which zsh)
```


