#!/bin/bash

# Check if GNU Stow is installed
if ! command -v stow &> /dev/null
then
    echo "GNU Stow could not be found. Please install it and try again."
    exit 1
fi

# Set the configuration directory
CONFIG="$HOME/.config"

# Export the CONFIG variable
export CONFIG

# Create necessary directories if they do not exist
mkdir -p "$CONFIG/nvim"
mkdir -p "$CONFIG/yabai"
mkdir -p "$CONFIG/skhd"

# Use stow to manage symlinks for configuration files
stow --verbose --restow --target="$CONFIG/nvim" nvim
stow --verbose --restow --target="$CONFIG/yabai" yabai
stow --verbose --restow --target="$CONFIG/skhd" skhd
stow --verbose --restow --target="$HOME" tmux
stow --verbose --restow --target="$HOME" zshrc

