#!/bin/bash
# Clone all solarized interesting repositories
# --------------------------------
# cyruz - http://ciroprincipe.info

PWD="$( pwd )"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

if [[ -d ./dircolors-solarized ]]; then
	rm -rf ./dircolors-solarized
fi
git clone https://github.com/seebi/dircolors-solarized.git
rm -rf ./dircolors-solarized/.git

if [[ -d ./tmux-colors-solarized ]]; then
	rm -rf ./tmux-colors-solarized
fi
git clone https://github.com/seebi/tmux-colors-solarized.git
rm -rf ./tmux-colors-solarized/.git

if [[ -d ./tty-solarized ]]; then
	rm -rf ./tty-solarized
fi
git clone https://github.com/joepvd/tty-solarized.git
rm -rf ./tty-solarized/.git
patch -p1 ./tty-solarized/tty-solarized-dark.sh ./patch/tty-solarized-dark.patch
patch -p1 ./tty-solarized/tty-solarized-light.sh ./patch/tty-solarized-light.patch

if [[ -d ./vim-colors-solarized ]]; then
	rm -rf ./vim-colors-solarized
fi
git clone https://github.com/altercation/vim-colors-solarized.git
rm -rf ./vim-colors-solarized/.git

cd $PWD
