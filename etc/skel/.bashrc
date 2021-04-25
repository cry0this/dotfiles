#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
    local EXIT="$?"             # This needs to be first
    PS1=""

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    PS1+="${Gre}[\u@\h]${RCol} ${BBlu}\w${RCol} ["

    if [ $EXIT != 0 ]; then
        PS1+="${Red}$EXIT${RCol}"      # Add red if exit code non 0
    else
        PS1+="${Gre}$EXIT${RCol}"
    fi

    PS1+="] ${BYel}$ ${RCol}"

}

PS2='> '

HISTTIMEFORMAT="%F:%T "

PATH="$HOME/.local/bin:$PATH"

case ${TERM} in
        xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
                ;;
        screen*)
                PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
                ;;
esac

use_color=true

alias ls='ls --color=auto'
alias ll='ls -laFh --color=auto'

source /usr/share/doc/pkgfile/command-not-found.bash
shopt -s checkwinsize

alias kill-wine='ps aux | grep -iE "(\.exe|wine)" | grep -v grep | awk "{print \$2}" | xargs -I{} kill -9 {}'
alias vim='nvim'

export XDG_CACHE_HOME=/tmp
export XDEBUG_CONFIG="idekey=PHPSTORM"
export XDG_CONFIG_HOME=~/.config
export GOPATH="$HOME/.local/go"

neofetch
