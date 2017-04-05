
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
let g:cache_home = empty($XDG_CACHE_HOME) ? '~/.cache' : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? '~/.config' : $XDG_CONFIG_HOME


let g:python3_host_prog = expand('~') . '/usr/bin/python'
set number
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:↲
set noswapfile
set tabstop=4
set shiftwidth=4
set modifiable
set write
set smartindent
set autoindent


"swapファイルをまとめて置く場所(DropBox対策)
"set swapfile
"set directory=~/.vimswap

"backupファイルをまとめて置く場所(DropBox対策)
"set backup
"set backupdir=~/.vimbackup
set nocompatible
"set encoding=utf-8
"set fencs=iso-2022-jp,sjis,euc-jp
set ambiwidth=double
set formatoptions+=mM
"set fe=japan
"Neomake settings

autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enalbed_makers = ['eslint']
" noremap
noremap <S-h> ^
noremap <S-j> }
noremap <S-k> {
noremap <S-l> $
imap <C-j> <esc>
noremap <C-j> <esc>

command InitVim tabe ~/.config/nvim/init.vim
command DeinLazy tabe ~/.config/nvim/rc/dein_lazy.toml

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
if has('win32')
else
"	set runtimepath^=/home/nagomi/.cache/dein/repos/github.com/Shougo/dein.vim
"	call dein#begin(expand('/home/nagomi/.cache/dein'))
endif

"""
" Dein TOML
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif
" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = g:config_home . '/nvim/rc'
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  " 設定終了
  call dein#end()
  call dein#save_state()
endif
" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


