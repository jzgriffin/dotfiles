# dotfiles

These are my personalized dotfiles for the following programs:
- alacritty
- dircolors
- nvim
- tmux
- zsh

## Dependencies

- stow
- clangd
- pep8
- flake8
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
:CocInstall coc-marketplace coc-json coc-clangd coc-cmake coc-pyright coc-rust-analyzer
```

### tmux

After starting tmux for the first time, press `<c-space> I` to install
plugins via tpm.
