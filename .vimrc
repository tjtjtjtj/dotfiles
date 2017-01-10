"#### 表示設定 ####
set number "行番号を表示する
set title "編集中のファイル名を表示する
"set noautoindent  "autoindentを無効にする
"set cindent  
" 入力中のコマンドをステータスに表示する
set showcmd
" Use two spaces for indentation
set tabstop=2 "インデントのスペースを2つ分に設定
set softtabstop=2
set shiftwidth=2
set expandtab

"-------Look&Feel-----
""TAB,EOFなどを可視化する
"set list
"set listchars=tab:>-,extends:<,trail:-,eol:<

syntax on

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'fatih/vim-go'
NeoBundle 'Shougo/neocomplete.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

let g:neocomplete#enabe_at_startup = 1
" vim-go  
""
let g:go_fmt_command = "goimports"
"" mapping  
""" go runのキーマッピング  
au FileType go nmap <Leader>gr <Plug>(go-run)  
""" go testのキーマッピング  
au FileType go nmap <Leader>gt <Plug>(go-test)  
"" highlight  
let g:go_hightlight_functions = 1  
let g:go_hightlight_methods = 1  
let g:go_hightlight_structs = 1  
let g:go_hightlight_interfaces = 1  
let g:go_hightlight_build_constraints = 1  
