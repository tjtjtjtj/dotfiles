"#### 表示設定 ####
set number "行番号を表示する
set title "編集中のファイル名を表示する
"set noautoindent  "autoindentを無効にする
"set cindent  
" 入力中のコマンドをステータスに表示する
set showcmd
" タブ文字（”\t”）1つを、何文字の空白文字（半角スペース）にするかの設定
set tabstop=2 
" タブ文字（”\t”）をキーボードで入力した時に、何文字の空白文字（半角スペース）にするかの設定
set softtabstop=2
" Vimで自動インデントを行う際に、何文字の空白文字（半角スペース）にするかの設定
set shiftwidth=2
" タブ文字（”\t”）を空白文字（半角スペース）にする。softtabstop と共に使う。
set expandtab

" 行番号の色
" au ColorScheme * highlight LineNr term=underline cterm=underline ctermfg=blue ctermbg=black
au ColorScheme * highlight LineNr ctermfg=blue ctermbg=black
" コメントの色を個別に設定
au ColorScheme * highlight Comment ctermfg=67

"-------Look&Feel-----
""TAB,EOFなどを可視化する
"set list
"set listchars=tab:>-,extends:<,trail:-,eol:<

syntax on

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  " 挙動を vi 互換ではなく、Vim のデフォルト設定にする
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Neobundleを利用するために :NeoBundleInstall を実行する
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'fatih/vim-go'
NeoBundle 'Shougo/neocomplete.vim'

" カラースキーマ
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'jpo/vim-railscasts-theme'

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'

" markdown syntax
NeoBundle 'plasticboy/vim-markdown'
" ansible yaml
NeoBundle 'chase/vim-ansible-yaml'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set background=dark
" colorscheme hybrid
colorscheme jellybeans

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
let GOPATH = '/root/go'

" vimでファイル指定されていない時にNERDTreeを起動
autocmd vimenter * if !argc() | NERDTree | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" 隠しファイルを表示する
let NERDTreeShowHidden = 1

" ファイル指定で開かれた場合はNERDTreeは表示しない
if !argc()
  autocmd vimenter * NERDTree|normal gg3j
endif
