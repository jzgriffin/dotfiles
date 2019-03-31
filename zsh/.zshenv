# Locally-customized zshenv prefix
[[ -f ~/.zshenv.local.pre ]] && source ~/.zshenv.local.pre

# Editing
export EDITOR=vim
export PAGER=less

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

# Append the user binary directories to the path
append_search_path ~/bin ~/.local/bin

# Locally-customized zshenv
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
