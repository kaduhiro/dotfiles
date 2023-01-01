"
"      ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄  
"     ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█  
"      ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄ 
"       ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
" ██▓    ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
" ▒▓▒    ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
" ░▒     ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒   
" ░        ░░   ▒ ░░      ░     ░░   ░ ░        
"  ░        ░   ░         ░      ░     ░ ░      
"  ░       ░                           ░        
"

" skip initialization for vim-tiny or vim-small
if 0 | endif

" Be iMproved
if &compatible
  set nocompatible
endif 

" replace leader
let g:mapleader = "\<Space>"

" configuration directory
let g:rc_dir = expand('~/.vim/autoload')

" plugins
let s:dein_dir = has('nvim') ? expand('~/.cache/dein/nvim') : expand('~/.cache/dein/vim')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:dein#lazy_rplugins = 1

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml      = g:rc_dir . '/dein/plugin.toml'
  let s:lazy_toml = g:rc_dir . '/dein/plugin_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

function! DeinClean() abort
  let s:removed_plugins = dein#check_clean()
  if len(s:removed_plugins) > 0
    call map(s:removed_plugins, "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
  endif
endfunction

command! CleanPlugins call DeinClean()

" load configuration
runtime! autoload/general.vim
runtime! autoload/mapping.vim
