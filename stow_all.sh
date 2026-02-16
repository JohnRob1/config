#!/bin/zsh

# ghostty
rm -rf ~/.config/ghostty
rm -rf ~/.cache/ghostty
mkdir ~/.config/ghostty
stow -R ghostty -t ~/.config/ghostty

# opencode
rm -rf ~/.config/opencode
rm -rf ~/.cache/opencode
mkdir ~/.config/opencode
stow -R opencode -t ~/.config/opencode

# nvim
rm -rf ~/.config/nvim
rm -rf ~/.cache/nvim
mkdir ~/.config/nvim
stow -R nvim -t ~/.config/nvim

# tmux
stow -R tmux -t ~
tmux source-file ~/.tmux.conf

# zsh
stow -R zsh -t ~
source ~/.zshrc
