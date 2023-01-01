inoremap <silent> jj <ESC>
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

nnoremap <Leader>. :e ~/.vimrc<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>

autocmd FileType vim setlocal foldmethod=marker
