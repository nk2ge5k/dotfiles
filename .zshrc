# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="minimal"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(golang docker docker-compose git kubectl git-flow zsh-autosuggestions colorize)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export EDITOR='vim'

alias zshconfig="vim ~/.zshrc && source ~/.zshrc"
alias timeout=gtimeout

# make dir recursive and change dir
mkdirc() {
    mkdir -p $1 && cd $1
}

docker-tty() {
    screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty
}

export LC_ALL="en_US.UTF-8"

export GOPATH="$HOME"
export GOROOT="$HOME/go"

export PATH="$GOROOT/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH=$GOPATH/src/github.com/uber/go-torch/FlameGraph:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/usr/local/opt/libpq/bin:$PATH

test -e "${HOME}/yandex-cloud/path.bash.inc" && source "${HOME}/yandex-cloud/path.bash.inc"
test -e "${HOME}/.yql/shell_completion" && source "${HOME}/.yql/shell_completion"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
