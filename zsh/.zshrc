# Locally-customized zshrc prefix
[[ -f ~/.zshrc.pre.local ]] && source ~/.zshrc.pre.local

# Modules
autoload -U compinit promptinit colors
compinit
promptinit
colors

# History
setopt -hg
HISTFILE=/dev/null
LESSHISTFILE=/dev/null

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
    [[ -f ~/.dircolors ]] && eval $(dircolors ~/.dircolors)
    alias ls='ls --color=auto'
fi

# Convenience aliases
alias ll='ls -l'
alias la='ls -a'
alias l='ls -la'
alias du='du -h'
alias df='df -h'

# Functions
take() {
    mkdir -p $1 && cd $1
}

# Prompts
prompt_prefix=""
if [[ "$simple_prompt" != "YES" ]]; then
    prompt_prefix="%{$fg[blue]%}%n%{$reset_color%}@%{$fg[red]%}%m%{$reset_color%}:"
fi
PROMPT="$prompt_prefix%{$fg_bold[white]%}%~%{$reset_color%}\$ "

# Locally-customized zshrc
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
