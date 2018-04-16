#!/bin/bash
# Update vim-markdown plugin
# --------------------------------
# cyruz - http://ciroprincipe.info

### git check
type git > /dev/null 2>&1 || { echo >&2 "Error: git not installed. Aborting."; exit 1; }

PWD="$( pwd )"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

if [[ ! -d vim-markdown ]]; then
	echo "vim-markdown not present, cloning git repository..."
	git clone https://github.com/tpope/vim-markdown.git
	FLAG=1
else
	echo "Checking if vim-markdown is current..."
	cd vim-markdown && git fetch
	[[ $(git rev-parse @) != $(git rev-parse @{u}) ]] && { echo "Updating vim-markdown..."; git pull; FLAG=1; }
	cd ..
fi

if [[ $FLAG -eq 1 ]]; then
	echo "Copying files to the vim configuration folders..."
	for i in ftdetect ftplugin syntax; do
		[[ ! -d $i ]] && mkdir $i
	done
	cp -af ./vim-markdown/ftdetect/* ./ftdetect/
	cp -af ./vim-markdown/ftplugin/* ./ftplugin/
	cp -af ./vim-markdown/syntax/* ./syntax/
	echo "vim-markdown has been updated."
else
	echo "vim-markdown is already on last version."
fi

cd $PWD
