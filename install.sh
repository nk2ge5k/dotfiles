#!/bin/bash

GO_VERSION=go1.13.5
GO_ARCH=amd64
GO_OS=linux
if [[ "$(uname)" == "Darwin" ]]; then
    GO_OS=darwin
fi

WORK_DIR=$(pwd)

# VIM
ln -sf $WORK_DIR/editor/.vimrc $HOME/.vimrc
ln -sf $WORK_DIR/editor/.vimrc.plugins $HOME/.vimrc.plugins
# PATHOGEN
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# TMUX 
ln -sf $WORK_DIR/shell/tmux.conf $HOME/.tmux.conf

# GIT
cat >> $HOME/.gitconfig <<EOF
[include]
    $WORK_DIR/shell/.gitconfig
EOF

# FISH
mkdir -p $HOME/.config &&
    ln -sf $WORK_DIR/shell/fish/config.fish $HOME/.config/fish/config.fish

executable() {
    local program="${1}"

    command -v $program > /dev/null
    if [[ "${?}" -ne 0 ]]; then
        return 1
    fi

    return 0
}

install() {
    local program="${1}"

    # FIXME
    if [[ "$(uname)" == "Darwin" ]]; then
        if ! executable $program; then
            echo "Installing $program..."
            #TODO(nk2ge5k): support other OS
            brew install $program
        else
            echo "$program already installed"
        fi
    fi
}

# Install GO
if ! executable go; then
    curl --silent https://storage.googleapis.com/golang/$GO_VERSION.$GO_OS-$GO_ARCH.tar.gz | tar xvz -C $HOME
fi

# Install Rust
if ! executable rust; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Install brew for MacOS
if [[ "$(uname)" == "Darwin" ]]; then
    if ! executable brew; then
        echo "Installing brew..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
fi

install fish
install git
install ssh
install tmux
install wget
install mutt
install w3c
