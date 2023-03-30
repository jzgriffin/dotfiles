# dotfiles

These are my personalized dotfiles for the following programs:
- alacritty
- dircolors
- nvim
- tmux
- zsh

## Dependencies

Dependencies are broken down by file/directory.

- alacritty
  - ttf-iosevka-nerd
- install.sh
  - stow
- nvim
  - coc-clangd
    - clangd
  - coc-cmake
    - cmake
  - coc-pyright
    - black
    - flake8
    - mypy
    - pep8
    - pyright
  - coc-rust-analyzer
    - rust-analyzer
  - coc
    - npm
  - ripgrep
- zsh
  - starship (optional; auto-detected if present)

These commands will install all dependencies on Arch Linux:
```
pacman -S git stow \
    alacritty ttf-iosevka-nerd \
    neovim clang cmake python-pip rustup rust-analyzer \
    npm ripgrep \
    tmux \
    zsh starship
pip install black flake8 mypy pep8 pyright
rustup default nightly
rustup component add rust-src clippy rustfmt
```

## Installation

```sh
git clone https://github.com/jzgriffin/dotfiles.git ~/.dotfiles
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
