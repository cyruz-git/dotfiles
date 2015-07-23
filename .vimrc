" ~/.vimrc
" --------------------------------
" cyruz - http://ciroprincipe.info

syntax on
filetype plugin on

" set color scheme
set background=dark
let g:solarized_termcolors=256 " degraded solarized 256 colorscheme
colorscheme solarized
"let g:solarized_termtrans=1

set nocompatible " leave the old ways behind...
" set nowrap " don't wrap lines
set nobackup " disable backup files (filename~)
set splitbelow " place new files below the current
set clipboard+=unnamed " yank and copy to X clipboard
set encoding=utf-8 " UTF-8 encoding for all new files
set backspace=2 " full backspacing capabilities (indent,eol,start)
set number " show line numbers
set ww=b,s,h,l,<,>,[,] " whichwrap -- left/right keys can traverse up/down
set linebreak " attempt to wrap lines cleanly
set wildmenu " enhanced tab-completion shows all matching cmds in a popup menu
" set spelllang=en_gb " real English spelling
set wildmode=list:longest,full
" set cursorline " slows down vim
set colorcolumn=120
let g:loaded_matchparen=1

" tabs and indenting
set noexpandtab " don't insert spaces instead of tabs
set tabstop=4 " tabs appear as n number of columns
set shiftwidth=4 " n cols for auto-indenting
" set autoindent " auto indents next new line

" searching
set hlsearch " highlight all search results
set incsearch " increment search
set ignorecase " case-insensitive search
set smartcase " uppercase causes case-sensitive search

" status bar info and appearance
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %l/%L]\ 
set laststatus=2
set cmdheight=1

if has("autocmd")
autocmd BufReadPost * if line("'\"")>0 && line("'\"")<=line("$")|exe "normal g`\""|endif	" always jump to the last cursor position
" autocmd BufRead *.txt set tw=80 " limit width to n cols for txt files
autocmd BufRead ~/.mutt/temp/mutt-* set tw=80 ft=mail nocindent spell	" width, mail syntax hilight, spellcheck
endif

" keep cursor centered
:nnoremap j jzz
:nnoremap k kzz

" space bar un-highligts search
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" allows writing to files with root priviledges
cmap w!! w !sudo tee % > /dev/null

" map for eventual errors
cmap W w
cmap Q q
