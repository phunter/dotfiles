export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Load Antigen
source ~/antigen/antigen.zsh

# load core of oh-my-zsh
antigen use oh-my-zsh

# zsh plugins
antigen bundle brew
antigen bundle common-aliases
antigen bundle dircycle
antigen bundle sudo
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

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
alias vimrc="$EDITOR ~/.vimrc"

# fix funky zsh behavior for bash scripts: ==
unsetopt equals

# bash-style command line comments
setopt interactivecomments

# bash-style backward kill
bindkey \^U backward-kill-line

# virtualenv stuff
export WORKON_HOME=$HOME/virtualenvs
export PROJECT_HOME=$HOME/projects
source /usr/local/bin/virtualenvwrapper.sh

# path to powerline root
export POWERLINE_ROOT=`pip show powerline-status | grep Location | cut -d " " -f 2`

# allow ssh forward agent on screen/tmux reconnect
AGENT=/tmp/ssh-agent-screen-${USER}
if [[ $TERM == "screen-256color" ]]; then
  export SSH_AUTH_SOCK="${AGENT}"
else
  test "${SSH_AUTH_SOCK}" && [[ "${SSH_AUTH_SOCK}" != "${AGENT}" ]] && ln -sf "${SSH_AUTH_SOCK}" "${AGENT}"
fi
unset AGENT:

# for zsh-history-substring-search
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='-e --prompt="ᐅ "'
