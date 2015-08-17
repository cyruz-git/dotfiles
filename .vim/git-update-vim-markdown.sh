#!/bin/bash
# Clone markdown plugin repository
# --------------------------------
# cyruz - http://ciroprincipe.info

PWD="$( pwd )"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

git clone https://github.com/tpope/vim-markdown.git
cp -af ./vim-markdown/ftdetect/* ./ftdetect/
cp -af ./vim-markdown/ftplugin/* ./ftplugin/
cp -af ./vim-markdown/syntax/* ./syntax/
rm -rf ./vim-markdown

cd $PWD
