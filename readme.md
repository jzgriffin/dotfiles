# dotfiles

These are my personalized dotfiles for the following programs:
- alacritty
- dircolors
- nvim
- tmux
- zsh

## Dependencies

- stow
- ccls
- ripgrep

## Installation

```sh
git clone https://github.com/nokurn/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
sh install.sh
```

### nvim

```
:PlugUpgrade
:PlugUpdate
:CocInstall coc-marketplace coc-json coc-ccls coc-cmake coc-lua coc-python coc-rust-analyzer
```
