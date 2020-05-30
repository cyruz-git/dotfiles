# ~/.bashrc
# --------------------------------
# cyruz - http://ciroprincipe.info


# If not running interactively, don't do anything.
[ -z "$PS1" ] && return


# ALIASES
# --------------------------------

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Cd
alias cd='ocd'

# Ls
alias ls='ols'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

# Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Fonts
type xfd &> /dev/null && alias fontshow='xfd -fa'

# Packages
LSB_OUT=$(lsb_release -d)
if grep -i "debian" <<< "$LSB_OUT"; then
    alias deb-purge-search='aptitude search '~c''
    alias deb-purge-rem='aptitude purge '~c''
elif grep -i "void" <<< "$LSB_OUT"; then
    alias xinstall='xbps-install'
    alias xquery='xbps-query'
    alias xremove='xbps-remove'
fi

# Processes
alias psall='ps axuf'
alias psusr='ps uf --ppid 2 -p 2 --deselect'

# Convenience
type vimcat &> /dev/null && alias ccat='vimcat'
alias sudo='sudo ' # Makes aliases work with sudo.
alias protectdir='touch ./-i'
alias rsyncacl="rsync -rv --chmod=ug+rwx,Fug-x,o-rwx"


# COLORS
# --------------------------------

# Source LS colors.
eval $( dircolors ~/.config/colors/ls/dircolors.ansi-universal )

# Source TTY colors.
. ~/.config/colors/tty/tty-solarized-dark.sh

# Source LESS colors.
. ~/.config/colors/less/less_colors_2


# FUNCTIONS
# --------------------------------

# ols - Override ls to show the name of the listed directory first
# Usage: ls <arguments>
ols() {
    __LS=""; __CN=0
    for i in $*; do [[ "${i:0:1}" != "-" ]] && __LS="${i}:" && __CN=$((__CN+1)); done
    case $__CN in
        0) echo $PWD:;;
        1) echo $__LS;;
    esac
    command ls -p --color=auto --group-directories-first $*
}

# ocd - Override cd to show the name of the changed directory
ocd() {
    command cd $*
    echo -e "\e[00;36m: $PWD"
}

# tcat - Output file content expanding tab to spaces
# Usage: tcat <filename>
tcat() {
    TABSTOPS=4
    cat $@ | expand -t${TABSTOPS}
}

# mkcd - Make a dir and cd into it
# Usage: mkcd <dir name>
mkcd() {
    mkdir $1
    cd $1
    return 0
}

# extract - Archive extractor
# Usage: extract <file>
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

# colortable - Show color table
# Usage: colortable
colortable() {
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

# colorlist - Show color list
# Usage: colorlist
colorlist() {
    x=`tput op` y=`printf %80s`
    for i in {0..256}; do
        o=00$i
        echo -e ${o:${#o}-3:3} `tput setaf $i
        tput setab $i`${y// /=}$x
    done
}


# EXPORTS
# --------------------------------

# Prompt customization.
#[ "$USER" = "root" ] && USRCOLOR="1;31m" || USRCOLOR="0;34m"
#PS1="┌─[\[\e[$USRCOLOR\]\u\[\e[1;32m\]@\[\e[0;34m\]\h\[\e[m\]][\[\e[0;32m\]\w\[\e[m\]]\n└─▪ "
PS1="\[\e[00;32m\]\u\[\e[00;34m\]@\[\e[00;32m\]\h \[\e[01;34m\]\W \`[ \$? = 0 ] && echo -e '\[\e[01;32m\]:)' || echo -e '\[\e[01;31m\]:('\` `[ \$UID = 0 ] && echo -e '\[\e[01;35m\]#' || echo -e '\[\e[01;34m\]$'`\[\e[00m\] "

# Don't put duplicate lines in the history. See bash(1) for more options.
# Don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoreboth

# Set general editors.
export VISUAL=vim
export EDITOR="$VISUAL"

# Set sudoedit variable.
export SUDO_EDITOR=/usr/bin/vim

# Terminal override.
# type alacritty &> /dev/null && export TERM=alacritty

# Export TERM variables for dvtm or to a general screen one if dvtm is not installed.
# Requires terminal definition in "/usr/share/terminfo/d/".
# To make KiTTY work the option "Allow ACS line drawing in UTF" must be checked in "Window > Translation".
# Eventually ACS drawing can be disabled exporting the variable "NCURSES_NO_UTF8_ACS=1".
# type dvtm &> /dev/null && export TERM=dvtm-256color || export TERM=screen-256color


# STARTUP
# --------------------------------

# Bash options.
shopt -s histappend
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable programmable completion features.
# No need to enable this, if already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc.
[ -f /etc/bash_completion ] && . /etc/bash_completion

# Start abduco + dvtm. !!! dvtm & abduco are not behaving correctly on a basic Void Linux setup !!!
type abduco &> /dev/null && abduco -A main dvtm

# Start tmux.
if [ "$PS1" != "" -a "${STARTED_TMUX:-x}" = x -a "${SSH_TTY:-x}" != x ]; then
    STARTED_TMUX=1; export STARTED_TMUX
    sleep 1
    if  tmux has-session -t main > /dev/null 2>&1; then
        tmux -2 -u attach-session -t main
    else
        tmux -2 -u new-session -s main
    fi
    exit 0
fi

