#!/bin/bash
# Customize shell and everyday tools.
# --------------------------------
# cyruz - http://ciroprincipe.info

### current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_FILES="
.bashrc
.config
.gitconfig
.profile
.tmux.conf
.vim
.vimrc
.xinitrc
.Xresources
"

echo "Copying configuration files to home..."

for i in $REPO_FILES; do cp -Rf "$DIR/$i" "$HOME/temp/test"; done

echo "Done."
