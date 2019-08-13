call plug#begin('~/.vim/plugged')

Plug 'ludovicchabant/vim-gutentags' "Generating Ctags
"Plug 'itchyny/lightline.vim' "status bar
Plug 'stephpy/vim-php-cs-fixer' "PHP Coding Style Check

"自動補全套件 ncm2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Include Phpactor
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'phpactor/ncm2-phpactor'

Plug 'mhinz/vim-signify' "顯示檔案修改的地方

Plug 'ntpeters/vim-better-whitespace' "結尾空白顯示
Plug 'jiangmiao/auto-pairs' "括號自動補齊
"Plug 'ervandew/supertab' "用 tab 選取候選字詞
Plug 'vim-syntastic/syntastic' "語法檢查
Plug 'tpope/vim-fugitive' "git 操作
Plug 'Yggdroot/indentLine' "縮排線
Plug 'kien/ctrlp.vim' "快速尋找檔案

Plug 'StanAngeloff/php.vim' "PHP 語法顏色調整
Plug '2072/PHP-Indenting-for-VIm' "PHP 縮排調整
Plug 'rayburgemeestre/phpfolding.vim' "PHP function 自動收合

Plug 'zxqfl/tabnine-vim' " 機器學習提示

" Initialize plugin system
call plug#end()

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
"let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Trace code for open new tab
map <C-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
