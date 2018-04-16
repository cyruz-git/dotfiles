#!/bin/bash
# Clone all solarized interesting repositories
# --------------------------------
# cyruz - http://ciroprincipe.info

### git check
type git > /dev/null 2>&1 || { echo >&2 "Error: git not installed. Aborting."; exit 1; }

PWD="$( pwd )"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

REPO="dircolors-solarized"
if [[ ! -d ./dircolors-solarized ]]; then
	echo "$REPO not present, cloning git repository..."
	git clone https://github.com/seebi/dircolors-solarized.git
else
	echo "Checking if $REPO is current..."
	cd dircolors-solarized && git fetch
	[[ $(git rev-parse @) != $(git rev-parse @{u}) ]] && { echo "Updating $REPO..."; git pull; } || echo "$REPO is already on last version."
	cd ..
fi

REPO="tmux-colors-solarized"
if [[ ! -d ./tmux-colors-solarized ]]; then
	echo "$REPO not present, cloning git repository..."
	git clone https://github.com/seebi/tmux-colors-solarized.git
else
	echo "Checking if $REPO is current..."
	cd tmux-colors-solarized && git fetch
	[[ $(git rev-parse @) != $(git rev-parse @{u}) ]] && { echo "Updating $REPO..."; git pull; } || echo "$REPO is already on last version."
	cd ..
fi

REPO="tty-solarized"
if [[ ! -d ./tty-solarized ]]; then
	echo "$REPO not present, cloning git repository..."
	git clone https://github.com/joepvd/tty-solarized.git
	FLAG=1
else
	echo "Checking if $REPO is current..."
	cd tty-solarized && git fetch
	[[ $(git rev-parse @) != $(git rev-parse @{u}) ]] && { echo "Updating $REPO..."; git pull; FLAG=1; } || echo "$REPO is already on last version."
	cd ..
fi
if [[ FLAG -eq 1 ]]; then
	echo "Patching $REPO..."
	patch -p1 ./tty-solarized/tty-solarized-dark.sh ./patch/tty-solarized-dark.patch
	patch -p1 ./tty-solarized/tty-solarized-light.sh ./patch/tty-solarized-light.patch
fi

REPO="vim-colors-solarized"
if [[ ! -d ./vim-colors-solarized ]]; then
	echo "$REPO not present, cloning git repository..."
	git clone https://github.com/altercation/vim-colors-solarized.git
else
	echo "Checking if $REPO is current..."
	cd vim-colors-solarized && git fetch
	[[ $(git rev-parse @) != $(git rev-parse @{u}) ]] && { echo "Updating $REPO..."; git pull; } || echo "$REPO is already on last version."
	cd ..
fi

cd $PWD
