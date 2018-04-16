# ~/.bashrc
# --------------------------------
# cyruz - http://ciroprincipe.info

# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# bash options
shopt -s histappend
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# prompt customization
set_prompt_style () {
	[ "$USER" = "root" ] && USRCOLOR="1;31m" || USRCOLOR="0;34m"
	PS1="┌─[\[\e[$USRCOLOR\]\u\[\e[1;32m\]@\[\e[0;34m\]\h\[\e[m\]][\[\e[0;32m\]\w\[\e[m\]]\n└─▪ "
}
set_prompt_style

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# export TERM for TMUX
export TERM=screen-256color

# source colors if file exists
[[ -f ~/.bashrc_colors ]] && . ~/.bashrc_colors

# source functions if file exists
[[ -f ~/.bashrc_functions ]] && . ~/.bashrc_functions

# source aliases if file exists
[[ -f ~/.bashrc_aliases ]] && . ~/.bashrc_aliases

# start tmux
#if [ "$PS1" != "" -a "${STARTED_TMUX:-x}" = x -a "${SSH_TTY:-x}" != x ]; then
#	STARTED_TMUX=1; export STARTED_TMUX
#	sleep 1
#	if  tmux has-session -t remote > /dev/null 2>&1; then
#		tmux -2 -u attach-session -t remote
#	else
#		tmux -2 -u new-session -s remote
#	fi
#	exit 0
#fi
