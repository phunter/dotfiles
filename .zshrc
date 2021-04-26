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
antigen bundle vi-mode

antigen bundle mattberther/zsh-pyenv
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# zsh theme
antigen theme ~/dotfiles/ phuntimes --no-local-clone

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

setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt csh_junkie_history
HISTSIZE=100000
SAVEHIST=100000

# allow ssh forward agent on screen/tmux reconnect
AGENT=/tmp/ssh-agent-screen-${USER}
if [[ $TERM == "screen-256color" ]]; then
  export SSH_AUTH_SOCK="${AGENT}"
else
  test "${SSH_AUTH_SOCK}" && [[ "${SSH_AUTH_SOCK}" != "${AGENT}" ]] && ln -sf "${SSH_AUTH_SOCK}" "${AGENT}"
fi
unset AGENT

# bash-style backward kill
bindkey '^U' backward-kill-line

# for zsh-history-substring-search
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export KEYTIMEOUT=1
bindkey -sM vicmd '^[' '^G'

# searching
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# it's like, space AND completion. Gnarlbot
bindkey -M viins ' ' magic-space

# custom binding for iterm2 option-.
autoload smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
bindkey "\x1f" insert-last-word
# custom binding for iterm2 option-m
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "\x1e" copy-earlier-word

# to unmap ctrl-s for vim
stty stop undef

# fuzzy find
export FZF_DEFAULT_OPTS='-e --prompt="ᐅ "'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pyenv stuff
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# path to powerline root
export POWERLINE_ROOT=`pip show powerline-status | grep Location | cut -d " " -f 2`

source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Created by `pipx` on 2021-04-06 22:20:20
export PATH="$PATH:/Users/hunter/.local/bin"
