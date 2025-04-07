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
  - npm
  - ripgrep
- zsh
  - starship (optional; auto-detected if present)

These commands will install all dependencies on Arch Linux:
```
pacman -S git stow \
    alacritty ttf-iosevka-nerd \
    neovim \
    npm ripgrep \
    tmux \
    zsh starship
```

I typically also install these packages:

- git
- zsh
- tmux
- stow
- neovim
- cmake
- ninja
- node
- ripgrep
- fd
- tree
- jq
- gum

## Installation

```sh
git clone https://github.com/jzgriffin/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
sh install.sh
```

### tmux

After starting tmux for the first time, press `<c-space> I` to install
plugins via tpm.
