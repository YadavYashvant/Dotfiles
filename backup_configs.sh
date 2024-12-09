#!/bin/bash

# Base directory for dotfiles
DOTFILES="$HOME/Dotfiles"

# Create necessary directories
mkdir -p "$DOTFILES/.config"

# Copy .config directories
cp -r ~/.config/foot "$DOTFILES/.config/"
cp -r ~/.config/hypr "$DOTFILES/.config/"
cp -r ~/.config/kitty "$DOTFILES/.config/"
cp -r ~/.config/ags "$DOTFILES/.config/"
cp -r ~/.config/nvim "$DOTFILES/.config/"
cp -r ~/.config/fish "$DOTFILES/.config/"

# Copy other important dotfiles
cp ~/.bashrc "$DOTFILES/"
cp ~/.zshrc "$DOTFILES/"
cp ~/.xinitrc "$DOTFILES/"
cp ~/.Xresources "$DOTFILES/"

# Make the script executable
chmod +x backup_configs.sh 