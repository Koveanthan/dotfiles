#!/usr/bin/sh

CONFIG=~/.config

export CONFIG

rm -rf $CONFIG

mkdir -p $CONFIG/nvim/

stow --verbose --restow --target=$CONFIG/nvim nvim
stow --verbose --restow --target=$CONFIG/yabai yabai 
stow --verbose --restow --target=$CONFIG/skhd skhd
stow --verbose --restow --target=~/.tmux.conf .tmux.conf

