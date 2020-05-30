#!/bin/bash
# Update vim plugins.
# --------------------------------
# cyruz - http://ciroprincipe.info

### git check
type git > /dev/null 2>&1 || { echo >&2 "Error: git not installed. Aborting."; exit 1; }

ODIR="$( pwd )"
CDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd /tmp
git clone https://github.com/tpope/vim-markdown.git

echo "Copying files to the vim configuration folders..."
cd $CDIR

for i in ftdetect ftplugin syntax; do [[ ! -d $i ]] && mkdir $i; done

cp -Rf /tmp/vim-markdown/ftdetect/* ./ftdetect/
cp -Rf /tmp/vim-markdown/ftplugin/* ./ftplugin/
cp -Rf /tmp/vim-markdown/syntax/* ./syntax/

rm -rf /tmp/vim-markdown
cd $PWD
echo "Done."
