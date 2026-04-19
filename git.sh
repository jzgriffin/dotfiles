#!/usr/bin/env bash

# Configuration
git config --global init.defaultBranch main
git config --global merge.conflictstyle diff3
git config --global pull.rebase true
git config --global rebase.autostash true

# Aliases
git config --global alias.a 'add'
git config --global alias.aa 'add --all'
git config --global alias.br 'branch'
git config --global alias.ci 'commit'
git config --global alias.cia 'commit --amend'
git config --global alias.ciane 'commit --amend --no-edit'
git config --global alias.cif 'commit --fixup'
git config --global alias.co 'checkout'
git config --global alias.cob 'checkout -b'
git config --global alias.com 'checkout main'
git config --global alias.cp 'cherry-pick'
git config --global alias.d 'diff'
git config --global alias.dh 'diff HEAD~ HEAD'
git config --global alias.drop 'reset --hard HEAD^'
git config --global alias.ds 'diff --staged'
git config --global alias.last 'log -1 HEAD'
git config --global alias.lol 'log --oneline'
git config --global alias.pub 'push origin HEAD:refs/for/main'
git config --global alias.rb 'rebase'
git config --global alias.rba 'rebase --abort'
git config --global alias.rbas 'rebase --autosquash'
git config --global alias.rbc 'rebase --continue'
git config --global alias.rbi 'rebase --interactive'
git config --global alias.rbm 'rebase main'
git config --global alias.rr 'restore'
git config --global alias.rs 'restore --staged'
git config --global alias.rt 'reset HEAD --'
git config --global alias.s 'status'
git config --global alias.spsp '!git stash && git pull && git stash pop'
git config --global alias.up 'pull origin'
git config --global alias.ups 'submodule update --init --recursive'
