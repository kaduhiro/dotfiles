" general
inoremap <silent> jj <ESC>
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" copy to end of line
nnoremap Y y$

" increment/decrement number
nnoremap + <C-a>
nnoremap - <C-x>

" command line
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" alias
nnoremap <Leader>. :e ~/.vimrc<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>

" file type
autocmd FileType vim setlocal foldmethod=marker

