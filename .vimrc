set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'ntpeters/vim-better-whitespace' "結尾空白顯示
Plugin 'jiangmiao/auto-pairs' "括號自動補齊
Plugin 'ervandew/supertab' "用 tab 選取候選字詞
Plugin 'vim-syntastic/syntastic' "語法檢查
Plugin 'tpope/vim-fugitive' "git 操作
Plugin 'Yggdroot/indentLine' "縮排線
Plugin 'kien/ctrlp.vim' "快速尋找檔案
Plugin 'mhinz/vim-signify' "顯示檔案修改的地方
Plugin 'stephpy/vim-yaml' "YAML 格式調整
Plugin 'pedrohdz/vim-yaml-folds' "YAML 收合
Plugin 'elzr/vim-json' "JSON 顯示

Plugin 'stephpy/vim-php-cs-fixer' "PHP Coding Style Check
Plugin 'StanAngeloff/php.vim' "PHP 語法顏色調整
Plugin '2072/PHP-Indenting-for-VIm' "PHP 縮排調整
Plugin 'rayburgemeestre/phpfolding.vim' "PHP function 自動收合

Plugin 'Valloric/YouCompleteMe' "程式碼自動補全
"Plugin 'shawncplus/phpcomplete.vim' "程式碼自動補全
"Plugin 'vim-scripts/AutoComplPop' "程式碼自動補全選單
Plugin 'ludovicchabant/vim-gutentags' "自動產生 tags
Plugin 'zxqfl/tabnine-vim' " 機器學習提示

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
syntax on
set t_Co=256
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set backspace=2
set softtabstop=4
set autoindent
set ruler
set nu
set hlsearch
set ignorecase
set incsearch
set ff=unix
set laststatus=2
set colorcolumn=120

" Statusline 自定義狀態列
source ~/.vim/source/status_line

" syntastic 顯示語法檢查
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" 切換頁籤
" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" 當前行
set cursorline
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
hi CursorLine   cterm=NONE ctermbg=NONE ctermfg=NONE

" 回到上次編輯的地方 (viminfo 要擁有寫入權限)
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

" 自動移除 Windows 換行符號 ^M
autocmd BufWritePre * :%s/\s\+$//e
"autocmd BufWritePre * :%s/\r/\r/g

" 自動補全方向
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" 程式碼自動補全
"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
"set completeopt=longest,menuone

" 設定 tags 位置 (根目錄跑 ctags -R)
" ctags -R --fields=+aimS --languages=php --exclude=web --exclude=libs/extlibs --exclude=libs/tests --exclude=model/tests --exclude=scripts --exclude=pixframework/coverage --exclude=api-doc
"set tags=~/work/tags

" Ctags setting
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 自動關閉提示 Scratch
let g:SuperTabClosePreviewOnPopupClose = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set foldmethod=syntax
let g:vim_json_syntax_conceal = 0 "JSON 冒號關閉
