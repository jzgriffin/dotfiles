# Locally-customized zshrc prefix
[[ -f ~/.zshrc.pre.local ]] && source ~/.zshrc.pre.local

# Modules
autoload -Uz compinit promptinit colors
compinit
promptinit
colors

# History
setopt -hg
setopt inc_append_history_time
setopt extended_history
HISTSIZE=32768
SAVEHIST=32768
HISTFILE=~/.zsh_history
LESSHISTFILE=/dev/null

# fzf configuration
export FZF_DEFAULT_COMMAND='rg --files'

# Piping aliases
alias -g G='| grep'
alias -g E='| egrep'
alias -g L="| $PAGER"

# Color aliases
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
if [[ "$(uname -s)" == "Darwin" || "$(uname -s)" =~ "BSD" ]]; then
    alias ls='ls -G'
else
    [[ -f $XDG_CONFIG_HOME/dir_colors ]] && eval $(dircolors $XDG_CONFIG_HOME/dir_colors)
    alias ls='ls --color=auto'
fi

# Convenience aliases
alias ll='ls -l'
alias la='ls -a'
alias l='ls -la'
alias du='du -h'
alias df='df -h'
alias rtree='rg --files | tree --fromfile'

# Functions
fpath+=~/.zsh_functions

take() {
    mkdir -p $1 && cd $1
}

# Prompts
prompt_prefix=""
if [[ "$simple_prompt" != "YES" ]]; then
    prompt_prefix="%{$fg[blue]%}%n%{$reset_color%}@%{$fg[red]%}%m%{$reset_color%}:"
fi
PROMPT="$prompt_prefix%{$fg_bold[white]%}%~%{$reset_color%}\$ "

# Base16 Shell
BASE16_SHELL="$XDG_DATA_HOME/base16-shell"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"
base16_tomorrow-night

# Locally-customized zshrc
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
