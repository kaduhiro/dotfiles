" --------------------------------------------------
" encoding
" --------------------------------------------------
scriptencoding utf-8

set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

set ambiwidth=double

" --------------------------------------------------
" visualization
" --------------------------------------------------
colorscheme molokai
" hi NonText    ctermfg=236 guifg=#303030 "rgb=48,48,48
" hi SpecialKey ctermfg=236 guifg=#303030 "rgb=48,48,48
" set list
" set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:･

set title
set number
set signcolumn=yes
set tabstop=2
" wrap line
set wrap
set display=lastline
" status line
set laststatus=2
" command line
set wildmenu
set wildmode=full
" hightlight brackets
set showmatch
set matchtime=1
" search
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan
" completion
set pumheight=10

" --------------------------------------------------
" history
" --------------------------------------------------
set history=10000

set undolevels=10000
if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    if !isdirectory(undo_path)
        call mkdir(undo_path, 'p')
    endif
    exe 'set undodir=' . undo_path
    set undofile
endif

" --------------------------------------------------
" syntax
" --------------------------------------------------
syntax enable

autocmd BufNewFile,BufRead *.{html,htm} set filetype=html

filetype plugin indent on

" --------------------------------------------------
" other
" --------------------------------------------------
" backup
set noswapfile
set nobackup
" backspace in insert mode
set backspace=2 " indent,eol,start
" acceleration
set lazyredraw
set ttyfast
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
