# dotfiles

These are my personalized dotfiles for the following programs:
- dircolors
- tmux
- vim
- zsh

## Installation

These dotfiles are meant for use with GNU stow.
```sh
git clone https://github.com/nokurn/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule update -init --recursive
stow dircolors
stow tmux
stow vim
stow zsh
```
