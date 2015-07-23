#!/bin/bash
# Customize shell and everyday tools.
# --------------------------------
# cyruz - http://ciroprincipe.info

### current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

### rsync check
type rsync >/dev/null 2>&1 || { echo >&2 "Error: rsync not installed. Aborting."; exit 1; }

### bash
echo Customizing bash...
cp -a $DIR/.profile ~/.profile
cp -a $DIR/.bash* ~/

### git
if type git >/dev/null 2>&1; then
	echo Customizing git...
	cp -a $DIR/.gitconfig ~/.gitconfig
fi

### tmux
if type tmux >/dev/null 2>&1; then
	echo Customizing tmux...
	cp -a $DIR/.tmux.conf ~/.tmux.conf
fi

rsync -Lav $DIR/.colors ~/

### vim
if type vim >/dev/null 2>&1; then
	echo Customizing vim...
	if [[ ! -d ~.vim/colors ]]; then
		mkdir -p ~/.vim/colors
	fi
	ln -s ~/.colors/solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim
	cp -a $DIR/.vimrc ~/.vimrc
fi

