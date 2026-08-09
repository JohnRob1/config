#!/bin/zsh

# ghostty
rm -rf ~/.config/ghostty
rm -rf ~/.cache/ghostty
mkdir ~/.config/ghostty
stow -R ghostty -t ~/.config/ghostty

# ruler
rm -rf ~/.config/ruler
mkdir -p ~/.config/ruler
stow -R ruler -t ~/.config/ruler

# nvim
rm -rf ~/.config/nvim
rm -rf ~/.cache/nvim
mkdir ~/.config/nvim
stow -R nvim -t ~/.config/nvim

# tmux
stow -R tmux -t ~
tmux source-file ~/.tmux.conf

# herdr
stow -R herdr -t ~/.config/herdr

# zsh
stow -R zsh -t ~
source ~/.zshrc
