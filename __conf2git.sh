#!/bin/bash
# Archives configuration files for the dotfiles repository.
# --------------------------------
# cyruz - http://ciroprincipe.info

### rsync check
type rsync > /dev/null 2>&1 || { echo >&2 "Error: rsync not installed. Aborting."; exit 1; }

USR="cyrus"
HOMEDIR="/home/$USR"
HOMEFILES="
$HOMEDIR/.bash_logout
$HOMEDIR/.bashrc
$HOMEDIR/.bashrc_aliases
$HOMEDIR/.bashrc_colors
$HOMEDIR/.bashrc_functions
$HOMEDIR/.colors
$HOMEDIR/.gitconfig
$HOMEDIR/.profile
$HOMEDIR/.tmux.conf
$HOMEDIR/.vimrc
"
DESTDIR="$HOMEDIR/dotfiles/"

rsync -Lav $HOMEFILES $ETCFILES $DESTDIR
chown -R $USR:$USR $DESTDIR

