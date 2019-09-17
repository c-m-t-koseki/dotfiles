umask 022

export TZ=Japan

export EDITOR=vim

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

_export_var() {
    [ ! -d $2 ] && return 1
    [[ $3 == - ]]                             \
        && eval "export $1=$2\${$1:+:\${$1}}" \
        || eval "export $1=\${$1:+\${$1}:}$2"
    return 0
}

_export_var PATH $HOME/bin
_export_var PATH $HOME/.local/bin
_export_var PATH $HOME/opt/bin -
_export_var PATH /usr/local/go/bin && \
    _export_var GOPATH $HOME/go    && \
    _export_var PATH $GOPATH/bin
_export_var PATH $HOME/src/github.com/junegunn/fzf/bin
# _export_var LD_LIBRARY_PATH /usr/local/cuda/lib64 && \
    # _export_var PATH /usr/local/cuda/bin/
_export_var LD_LIBRARY_PATH /usr/local/lib/cudnn_v7

if [ -f "$HOME/.local/.bash_profile" ]; then
    . "$HOME/.local/.bash_profile"
fi

unset -f _export_var

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
