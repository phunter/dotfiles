# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="phuntimes"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

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

export EDITOR=emacs
export SVN_EDITOR=emacs

alias ll='ls -l'

alias svnclean="svn status --no-ignore | grep -E '^[\?I]' | cut -c9- | tr '\n' '\0' | xargs -0 rm -r"
alias svnuntracked="svn st --no-ignore | grep -E '^[\?I]'"

# fix funky behavior for bash scripts: ==
unsetopt equals

# for the analyzer intel libraries
source /opt/intel/ipp/bin/ippvars.sh intel64
source /opt/intel/mkl/bin/mklvars.sh intel64

# bash-style command line comments
setopt interactivecomments

# Hunter's API Key
export ECHO_NEST_API_KEY='LRNCCNOF57RMM7LXK'

# powerline
# . /Users/hmccurry/code/github/powerline/powerline/bindings/zsh/powerline.zsh

# svn stuff
# export SVN=https://svn.echonest.com/repos
export SVN=https://svn.p.echonest.net/svn/echonest

# compiler stuff?
export CC=gcc

# virtualenv stuff
export WORKON_HOME=$HOME/virtualenvs
export PROJECT_HOME=$HOME/projects
source /usr/local/bin/virtualenvwrapper.sh

# z (https://github.com/rupa/z)
. github/z/z.sh

# Java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

# NPM
alias spm="npm -reg http://npm-registry.spotify.net -userconfig ~/.spmrc --always-auth=true"