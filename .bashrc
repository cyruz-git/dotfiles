# ~/.bashrc
# --------------------------------
# cyruz - http://ciroprincipe.info


# ALIASES
# --------------------------------

# 'directory' group
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# 'ls' group
alias ls='ls -p --color=auto --group-directories-first'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias llt='ls -lt'
alias llat='ls -lat'

# 'grep' group
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# packages aliases
alias pkg-purge-search='aptitude search '~c''
alias pkg-purge-rem='aptitude purge '~c''

# ps aliases
alias psall='ps axuf'
alias psusr='ps uf --ppid 2 -p 2 --deselect'

# convenient aliases
alias sudo='sudo '
alias protectdir='touch ./-i'
alias rsyncacl="rsync -rv --chmod=ug+rwx,Fug-x,o-rwx"


# COLORS
# --------------------------------

# source LS colors
eval $( dircolors ~/.colors/solarized/dircolors-solarized/dircolors.256dark )

# source TTY colors
. ~/.colors/solarized/tty-solarized/tty-solarized-dark.sh

# source LESS colors
. ~/.colors/generic/less/less_colors_2


# FUNCTIONS
# --------------------------------

# mkcd - make a dir and cd into it
# usage: mkcd <dir name>
mkcd() {
	mkdir $1
	cd $1
	return 0
}

# extract - archive extractor
# usage: extract <file>
extract() {
	if [ -f "$1" ] ; then
		case "$1" in
			*.tar.bz2) tar xvjf "$1" ;;
			*.tar.gz) tar xvzf "$1" ;;
			*.bz2) bunzip2 "$1" ;;
			*.rar) unrar x "$1" ;;
			*.gz) gunzip "$1" ;;
			*.tar) tar xvf "$1" ;;
			*.tbz2) tar xvjf "$1" ;;
			*.tgz) tar xvzf "$1" ;;
			*.zip) unzip "$1" ;;
			*.Z) uncompress "$1" ;;
			*.7z) 7z x "$1" ;;
			*)
		echo "Not a valid archive"
		return 1
		;;
		esac
	else
		echo "Not a valid file"
		return 1
	fi
	return 0
}

# fullbackup - backup entire system
# usage: fullbackup
fullbackup() {
	read -p "Starting complete system backup, are you sure? " -n 1 -r ; echo
	if [[ $REPLY =~ ^[Yy]$ ]] ; then
		sudo tar cvpzf /tmp/rootfs-backup.tar.gz --exclude=/dev --exclude=/proc --exclude=/sys --exclude=/tmp --exclude=/lost+found --exclude=/media --exclude=/mnt /
		echo -e "\n\nDone! Backup ready in /tmp/rootfs-backup.tar.gz."
	fi
}

# fullrestore - restore system from backup
# usage: fullrestore <path to file>
fullrestore() {
	[ "$#" -eq 1 ] || { echo "Usage: fullrestore <path to file>" ; return 1 ; } 
	read -p "Starting complete system restore, are you sure? " -n 1 -r ; echo
	if [[ $REPLY =~ ^[Yy]$ ]] ; then
		sudo tar xvpzf "$1" -C /
		echo -e "\n\nDone! Restore complete."
	fi
}

colorcheck() {
	T='gYw'   # The test text

	echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m";

	for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
               '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
               '  36m' '1;36m' '  37m' '1;37m';
		do FG=${FGs// /}
		echo -en " $FGs \033[$FG  $T  "
		for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
			do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
		done
		echo
	done
	echo
}

colorshow() {
	x=`tput op` y=`printf %80s`
	for i in {0..256}; do
		o=00$i
		echo -e ${o:${#o}-3:3} `tput setaf $i
		tput setab $i`${y// /=}$x
	done
}


# STARTUP
# --------------------------------

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

