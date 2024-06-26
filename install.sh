# Install symlinks to package configurations AFTER pulling submodules
git submodule update --init --recursive
stow alacritty
stow dircolors
stow nvim
stow tmux
stow zsh

# Install git aliases
git config --global alias.aa 'add --all'
git config --global alias.br 'branch'
git config --global alias.ci 'commit'
git config --global alias.cia 'commit --amend'
git config --global alias.ciane 'commit --amend --no-edit'
git config --global alias.co 'checkout'
git config --global alias.cob 'checkout -b'
git config --global alias.com 'checkout main'
git config --global alias.cp 'cherry-pick'
git config --global alias.d 'diff'
git config --global alias.dh 'reset --hard HEAD^'
git config --global alias.ds 'diff --staged'
git config --global alias.last 'log -1 HEAD'
git config --global alias.lol 'log --oneline'
git config --global alias.rb 'rebase'
git config --global alias.rba 'rebase --abort'
git config --global alias.rbc 'rebase --continue'
git config --global alias.rbi 'rebase --interactive'
git config --global alias.rbm 'rebase main'
git config --global alias.st 'status'
git config --global alias.unstage 'reset HEAD --'
git config --global alias.up 'pull origin'
git config --global alias.ups 'submodule update --init --recursive'
