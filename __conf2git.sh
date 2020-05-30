#!/bin/bash
# Archives configuration files for the dotfiles repository.
# --------------------------------
# cyruz - http://ciroprincipe.info

HOME_FILES="
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
DEST_DIR="$HOME/dotfiles"

echo "Copying configuration files to repository..."

for i in $HOME_FILES; do cp -Rf "$HOME/$i" "$DEST_DIR/"; done

# Remove google-chrome directory if present.
[[ -d "$DEST_DIR/.config/google-chrome" ]] && rm -rf "$DEST_DIR/.config/google-chrome"

echo "Done."
