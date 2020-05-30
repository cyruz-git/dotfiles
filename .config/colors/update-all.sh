#!/bin/bash
# Update all color files.
# --------------------------------
# cyruz - http://ciroprincipe.info

### wget check
type wget > /dev/null 2>&1 || { echo >&2 "Error: wget not installed. Aborting."; exit 1; }

ODIR="$( pwd )"
CDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $CDIR

[[ ! -d ./ls ]] && mkdir -p ls
echo -e "Downloading ls color files...\n"
BASE_URL=https://raw.githubusercontent.com/seebi/dircolors-solarized/master
wget -nv -O ./ls/dircolors.256dark        $BASE_URL/dircolors.256dark
wget -nv -O ./ls/dircolors.ansi-dark      $BASE_URL/dircolors.ansi-dark
wget -nv -O ./ls/dircolors.ansi-light     $BASE_URL/dircolors.ansi-light
wget -nv -O ./ls/dircolors.ansi-universal $BASE_URL/dircolors.256dark

[[ ! -d ./x ]] && mkdir -p x
echo -e "\nDownloading xresources color files...\n"
BASE_URL=https://raw.githubusercontent.com/solarized/xresources/master
wget -nv -O ./x/Xresources.dark  $BASE_URL/Xresources.dark
wget -nv -O ./x/Xresources.light $BASE_URL/Xresources.light

[[ ! -d ./tmux ]] && mkdir -p tmux
echo -e "\nDownloading tmux color files...\n"
BASE_URL=https://raw.githubusercontent.com/seebi/tmux-colors-solarized/master
wget -nv -O ./tmux/tmuxcolors-256.conf    $BASE_URL/tmuxcolors-256.conf
wget -nv -O ./tmux/tmuxcolors-base16.conf $BASE_URL/tmuxcolors-base16.conf
wget -nv -O ./tmux/tmuxcolors-dark.conf   $BASE_URL/tmuxcolors-dark.conf
wget -nv -O ./tmux/tmuxcolors-light.conf  $BASE_URL/tmuxcolors-light.conf
wget -nv -O ./tmux/tmuxcolors.tmux        $BASE_URL/tmuxcolors.tmux

[[ ! -d ./tty ]] && mkdir -p tty
echo -e "\nDownloading tty solarized files...\n"
BASE_URL=https://raw.githubusercontent.com/joepvd/tty-solarized/master
wget -nv -O ./tty/tty-solarized-dark.sh  $BASE_URL/tty-solarized-dark.sh
wget -nv -O ./tty/tty-solarized-light.sh $BASE_URL/tty-solarized-light.sh
for i in ./tty/*; do
    sed -i -E 's/^if \[/\#if \[/' "$i"
    sed -i -E 's/^fi\s*$/\#fi/'   "$i"
done

[[ ! -d ./vim ]] && mkdir -p vim
echo -e "\nDownloading vim color files...\n"
BASE_URL=https://github.com/altercation/vim-colors-solarized/blob/master/colors
wget -nv -O ./vim/solarized.vim $BASE_URL/solarized.vim
BASE_URL=https://raw.githubusercontent.com/romainl/flattened/master/colors
wget -nv -O ./vim/flattened_dark.vim  $BASE_URL/flattened_dark.vim
wget -nv -O ./vim/flattened_light.vim $BASE_URL/flattened_light.vim

cd $ODIR
echo -e "\nDone.\n"
