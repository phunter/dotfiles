# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="phuntimes"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git svn virtualenv tmux brew virtualenvwrapper sublime)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export EDITOR=vim
export SVN_EDITOR=vim

alias ll='ls -l'
alias la='ls -la'

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
