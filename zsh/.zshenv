# Locally-customized zshenv prefix
[[ -f ~/.zshenv.local.pre ]] && source ~/.zshenv.local.pre

# XDG paths
[[ -z "$XDG_CONFIG_HOME" ]] && export XDG_CONFIG_HOME="$HOME/.config"
[[ -z "$XDG_CACHE_HOME" ]] && export XDG_CACHE_HOME="$HOME/.cache"
[[ -z "$XDG_DATA_HOME" ]] && export XDG_DATA_HOME="$HOME/.local/share"

# Editing
export EDITOR=nvim
export PAGER=less
export TERMINAL=alacritty

# Search path
typeset -U path # Declare the path array as a set

# Appends existent directories to the path
append_search_path() {
    for i in $*; do
        [[ -d $i ]] && path+=$i
    done
}

# Prepends existent directories to the path
prepend_search_path() {
    for i in $*; do
        [[ -d $i ]] && path=($i $path)
    done
}

# Prepend the user binary directories to the path
prepend_search_path ~/bin ~/.local/bin

# Include Cargo if installed
[[ -f ~/.cargo/env ]] && source ~/.cargo/env
prepend_search_path ~/.cargo/bin

# Locally-customized zshenv
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
