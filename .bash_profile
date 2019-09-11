umask 022


_export_var() {
    [ ! -d $2 ] && return 1
    [ -n "$(eval echo \$$1)" ] \
        && eval "export $1=$2:\$$1" \
        || eval "export $1=$2"
    return 0
}

_export_var PATH $HOME/bin
_export_var PATH $HOME/.local/bin

unset -f _export_var

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
