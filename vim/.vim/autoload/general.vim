scriptencoding utf-8

set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

set ambiwidth=double

colorscheme molokai

syntax enable
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html

filetype plugin indent on

set title
set number
set tabstop=2

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:･

hi NonText    ctermfg=236 guifg=#303030 "rgb=48,48,48
hi SpecialKey ctermfg=236 guifg=#303030 "rgb=48,48,48

set wildmenu
set wildmode=full

set lazyredraw
set ttyfast

set history=1000

set undolevels=1000
if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    if !isdirectory(undo_path)
        call mkdir(undo_path, 'p')
    endif
    exe 'set undodir=' . undo_path
    set undofile
endif

set clipboard+=unnamed
set backspace=indent,eol,start

set showmatch
set laststatus=2
set nobackup
set noswapfile

set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan

" no indent when copy from clipboard
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
