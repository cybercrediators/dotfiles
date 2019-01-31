cd() { builtin cd "$@" && ls -al; }
complete -cf sudo

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
