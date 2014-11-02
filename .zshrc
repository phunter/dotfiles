export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Load Antigen
source ~/antigen/antigen.zsh

# load core of oh-my-zsh
antigen use oh-my-zsh

# zsh plugins
antigen bundle common-aliases
antigen bundle dircycle
antigen bundle sudo
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zaw

# zsh theme
antigen theme ~/dotfiles/ phuntimes

# tell antigen that you're done
antigen apply

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

export EDITOR=vim
export SVN_EDITOR=vim

# fix funky zsh behavior for bash scripts: ==
unsetopt equals

# bash-style command line comments
setopt interactivecomments

# virtualenv stuff
export WORKON_HOME=$HOME/virtualenvs
export PROJECT_HOME=$HOME/projects
source /usr/local/bin/virtualenvwrapper.sh

# allow ssh forward agent on screen/tmux reconnect
AGENT=/tmp/ssh-agent-screen-${USER}
if [[ $TERM == "screen-256color" ]]; then
  export SSH_AUTH_SOCK="${AGENT}"
else
  test "${SSH_AUTH_SOCK}" && [[ "${SSH_AUTH_SOCK}" != "${AGENT}" ]] && ln -sf "${SSH_AUTH_SOCK}" "${AGENT}"
fi
unset AGENT:

# zaw for history search
bindkey '^R' zaw-history
bindkey -M filterselect '^R' down-line-or-history
bindkey -M filterselect '^S' up-line-or-history
bindkey -M filterselect '^E' accept-search

zstyle ':filter-select:highlight' matched fg=green
zstyle ':filter-select' max-lines 5
zstyle ':filter-select' case-insensitive yes # enable case-insensitive 
zstyle ':filter-select' extended-search yes # see below

# https://github.com/juanmasg/zshrc/blob/master/yank-nth-arg.zsh 
yank-nth-arg() {
    local line="${history[${#history}]}"
    zle -U ${${(-z)line}[2]}
}

zle -N yank-nth-arg
bindkey "^[^y" yank-nth-arg
