" ~/.vimrc
" --------------------------------
" cyruz - http://ciroprincipe.info

syntax on
filetype plugin on

" Color scheme
set background=dark
colorscheme flattened_dark
if $DISPLAY != "" && exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set nocompatible " Leave the old ways behind...
" set nowrap " Don't wrap lines.
set nobackup " Disable backup files (filename~).
set splitbelow " Place new files below the current.
set clipboard+=unnamed " Yank and copy to X clipboard.
set encoding=utf-8 " UTF-8 encoding for all new files.
set backspace=2 " Full backspacing capabilities (indent, eol, start).
set number " Show line numbers.
set ww=b,s,h,l,<,>,[,] " Whichwrap -- left/right keys can traverse up/down.
set linebreak " Attempt to wrap lines cleanly.
set wildmenu " Enhanced tab-completion shows all matching cmds in a popup menu.
" set spelllang=en_gb " Real English spelling.
set wildmode=list:longest,full
" set cursorline " Turn on cursor line (disabled - slows down vim).
set colorcolumn=120
let g:loaded_matchparen=1

" Mouse configuration
set mouse=a " Enable scrolling on vim.

" Tabs and indenting
set expandtab " Insert spaces instead of tabs.
set tabstop=4 " Tabs appear as n number of columns.
set shiftwidth=4 " N cols for auto-indenting.
set autoindent " Auto indents next new line.

" Searching
set hlsearch " Highlight all search results.
set incsearch " Increment search.
set ignorecase " Case-insensitive search.
set smartcase " Uppercase causes case-sensitive search.

" Status bar
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [ROW:\ %l/%L\ »\ %p%%]\ [COL:\ %c]\  
set laststatus=2
set cmdheight=1

if has("autocmd")
autocmd BufReadPost * if line("'\"")>0 && line("'\"")<=line("$")|exe "normal g`\""|endif " Always jump to the last cursor position.
" autocmd BufRead *.txt set tw=80 " Limit width to n cols for txt files.
autocmd BufRead ~/.mutt/temp/mutt-* set tw=80 ft=mail nocindent spell " Width, mail syntax hilight, spellcheck.
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
endif

" Keep cursor centered.
nnoremap j jzz
nnoremap k kzz

" Space bar un-highligts search.
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Allows writing to files with root priviledges.
cmap w!! w !sudo tee % > /dev/null

" Map for eventual errors.
cmap W w
cmap Q q
