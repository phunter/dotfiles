# a direct descendant of the steeef theme:
# http://github.com/robbyrussell/oh-my-zsh/blob/master/themes/steeef.zsh-theme
# 
# prompt style and colors based on Steve Losh's Prose theme:
# http://github.com/sjl/oh-my-zsh/blob/master/themes/prose.zsh-theme
#
# vcs_info modifications from Bart Trojanowski's zsh prompt:
# http://www.jukie.net/bart/blog/pimping-out-zsh-prompt
#
# git untracked files modification from Brian Carper:
# http://briancarper.net/blog/570/git-info-in-your-zsh-prompt

PR_GIT_UPDATE=1

setopt prompt_subst
autoload colors
colors

autoload -U add-zsh-hook
autoload -Uz vcs_info

#use extended color pallete if available
if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
    yellow="%F{11}"
    blue="%F{27}"
else
    turquoise="$fg[cyan]"
    orange="$fg[yellow]"
    purple="$fg[magenta]"
    hotpink="$fg[red]"
    limegreen="$fg[green]"
    yellow="$fg[yellow]"
    blue="fg[blue]"
fi

PR_RST="%{$reset_color%}"

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo " with %{$hotpink%}`basename $VIRTUAL_ENV`${PR_RST}"
}

# enable VCS systems you use
zstyle ':vcs_info:*' enable git svn

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true

# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stagedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
FMT_BRANCH=" on %{$turquoise%}%b%u%c${PR_RST}"
FMT_ACTION="during %{$blue%}%a${PR_RST}"
FMT_UNSTAGED="%{$orange%}●"
FMT_STAGED="%{$limegreen%}●"

zstyle ':vcs_info:*:prompt:*' unstagedstr   "${FMT_UNSTAGED}"
zstyle ':vcs_info:*:prompt:*' stagedstr     "${FMT_STAGED}"
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH} ${FMT_ACTION}"
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""


function phuntimes_preexec {
    case "$(history $HISTCMD)" in
        *git*)
            PR_GIT_UPDATE=1
            ;;
        *svn*)
            PR_GIT_UPDATE=1
            ;;
    esac
}
add-zsh-hook preexec phuntimes_preexec

function phuntimes_chpwd {
    PR_GIT_UPDATE=1
}
add-zsh-hook chpwd phuntimes_chpwd

function phuntimes_precmd {
    if [[ -n "$PR_GIT_UPDATE" ]] ; then
        # check for untracked files or updated submodules, since vcs_info doesn't
        if git ls-files --other --exclude-standard --directory 2> /dev/null | grep -q "."; then
            PR_GIT_UPDATE=1
            FMT_BRANCH=" on %{$turquoise%}%b%u%c%{$hotpink%}●${PR_RST}"
        else
            FMT_BRANCH=" on %{$turquoise%}%b%u%c${PR_RST}"
        fi
        zstyle ':vcs_info:*:prompt:*' formats "${FMT_BRANCH}"

        vcs_info 'prompt'
        PR_GIT_UPDATE=
    fi
}
add-zsh-hook precmd phuntimes_precmd

function zle-line-init zle-keymap-select zle-line-finish {
    MODE_STR=" mode %{$yellow%}normal${PR_RST}"
    MODE_INDICATOR="${${KEYMAP/vicmd/$MODE_STR}/(main|viins|opp)/}"
    zle reset-prompt
    zle -R
}
zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish

USER_PROMPT=%{$purple%}%n${PR_RST}
HOST_PROMPT=%{$orange%}%m${PR_RST}
DIR_PROMPT=%{$limegreen%}%~${PR_RST}
PROMPT=$'
╭─$USER_PROMPT at $HOST_PROMPT in $DIR_PROMPT$(virtualenv_info)$vcs_info_msg_0_$MODE_INDICATOR
╰─ᐅ '
RPS1=" "
