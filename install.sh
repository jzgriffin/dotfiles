#!/usr/bin/env bash

git submodule update --init --recursive

# Install symlinks to package configurations AFTER pulling submodules
stow alacritty
stow dircolors
stow nvim
stow tmux
stow zsh

# Run individual install scripts
bash git.sh
