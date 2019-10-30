" General Settings ---------------------------------------------------------------------------------------------------

"" Hightlight
set cursorline                        " Highlight the screen line of the cursor
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
hi CursorLine   cterm=NONE ctermbg=NONE ctermfg=NONE
set showmatch                         " Cursor shows matching ) and }
syntax on                             " Syntax highlight

"" Autocomplete
set completeopt=longest,menu          " Only insert the longest common text of the matches
set pumheight=10                      " Determines the maximum number of items to show in the popup menu
set wildmenu                          " Wild char completion menu
set wildchar=<TAB>                    " Start wild expansion in the command line using <TAB>

"" Backups
set history=50                        " Keep 50 lines of command line history
set nobackup                          " No *~ backup files
set nowritebackup                     " Do not make a backup before overwriting a file
set noswapfile                        " Do not use a swapfile for the buffer

"" Colors
set background=dark                   " Dark background
set t_Co=256                          " 256 color mode

"" Editing
set backspace=eol,start,indent        " Controlling What the Backspace Key Does
"set timeoutlen=500                    " The time in milliseconds that is waited for a key code
set expandtab                         " Use the appropriate number of spaces to insert a <Tab>
set autoindent                        " Copy indent from current line when starting a new line
set copyindent                        " copy the previous indentation on autoindenting
set shiftwidth=4                      " Number of spaces to use for each step of indent
set tabstop=4                         " Number of spaces that a <Tab> in the file counts for
set softtabstop=4
"set textwidth=79                      " Set the text width
set scrolloff=7                       " No scroll offset

"" Font
set encoding=UTF-8                    " Set default encoding to UTF-8
set ff=unix

"" Files
set autoread                          " Auto read when file is changed from outside
filetype on                           " Enable filetype detection
filetype indent on                    " Enable filetype-specific indenting
filetype plugin on                    " Enable filetype-specific plugins

"" Folding
set foldnestmax=3                     " Sets the maximum nesting of folds
set foldmethod=syntax                 " The kind of folding
set foldenable                        " Code folding
set foldcolumn=1                      " Add a bit extra margin to the left

"" Display
"set ruler                             " Shows line number and column
"set rulerformat=%l\:%c                " Better ruler format
set number                            " Display line numbers
set colorcolumn=120                  " Display a ruler at a specific line

"" Search
set wildignore=*.o,*~,*.pyc           " Ignore these files while expanding wild chars
set fillchars=stl:\ ,stlnc:\ ,vert:\ ,fold:\ ,diff:\  " Hide horizontal line between windows
set hlsearch                          " Search highlighting
set incsearch                         " Incremental search
set ignorecase                        " Ignore case when searching
set smartcase                         " Ignore case if search pattern is all lowercase,case-sensitive otherwise
set magic                             " Search with regex

"" Status line
set laststatus=2                      " Open status line
set showmode                          " Show current mode

"" User Interface
set nocompatible                      " Make sure Vim is not in compatible mode
set lazyredraw                        " Don't redraw while executing macros

"" Word Wrap
set linebreak                         " Make Vim break lines without breaking words
set wrap                              " Line wrapping
set formatoptions+=r

"" Window and Tabs
set splitright                        " Put the new splited window right of the current one
set tabpagemax=100                    " Maximum number of tab pages
set hidden                            " Buffer becomes hidden when it is |abandon|ed
set smarttab                          " Insert tabs on the start of a line according to context

"" Warnings
set noerrorbells                      " No annoying sound on errors
set novisualbell                      " No visual bell
set t_vb=                             " No beep or flash

" Autocmd ------------------------------------------------------------------------------------------------------------

"" return to last edit position when opening files
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line('$') |
\   exe "normal! g`\"" |
\ endif

"" go specific tab
for i in range(1, 9)
    exec 'noremap <Leader>'.i.' '.i.'gt'
endfor

" Keybinding

"" Mapleader
let mapleader = "\<Space>"

"" Splitting
noremap <silent> <Leader>v :vsplit<CR>
noremap <silent> <Leader>h :split<CR>

"" tab change
map <S-H> gT
map <S-L> gt

"" Remove Windows's new line character
autocmd BufWritePre * :%s/\s\+$//e

"" YAML file setting
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Customize  ---------------------------------------------------------------------------------------------------------

"" Status line
source ~/.vim/customize/status_line

" Plugin -------------------------------------------------------------------------------------------------------------

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"" Autocomplete
"Plug 'zxqfl/tabnine-vim' " 機器學習提示
Plug 'ycm-core/YouCompleteMe'

Plug 'ludovicchabant/vim-gutentags'
"set tags=./.tags;,.tags

" 搜索工程目錄的標誌，碰到這些文件/目錄名就停止向上一級目錄遞歸
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

"配置 ctags 的參數
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabClosePreviewOnPopupClose = 1

"" git
Plug 'tpope/vim-fugitive' "git 操作

"" Linting
Plug 'vim-syntastic/syntastic' "語法檢查
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Plug 'dense-analysis/ale' "異步代碼檢測

"" Displaying
Plug 'Yggdroot/indentLine' "縮排線
"Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'ntpeters/vim-better-whitespace' "結尾空白顯示
Plug 'mhinz/vim-signify' "顯示檔案修改的地方
Plug 'stephpy/vim-yaml' "YAML 格式調整
Plug 'pedrohdz/vim-yaml-folds' "YAML 收合
Plug 'elzr/vim-json' "JSON 顯示
let g:vim_json_syntax_conceal = 0 "JSON 冒號關閉

"" Colorscheme
Plug 'gmoe/vim-espresso'
Plug 'sainnhe/edge'
Plug 'sainnhe/archived-colors'
Plug 'sainnhe/vim-color-lost-shrine'
Plug 'sainnhe/vim-color-atlantis'
Plug 'rafalbromirski/vim-aurora'
Plug 'lithammer/vim-eighties'
Plug 'dunstontc/vim-vscode-theme'

"colorscheme edge

"" Searching
Plug 'haya14busa/incsearch.vim'

"" Editing
Plug 'jiangmiao/auto-pairs' "括號自動補齊

"" PHP
Plug 'stephpy/vim-php-cs-fixer' "PHP Coding Style Check
Plug 'StanAngeloff/php.vim' "PHP 語法顏色調整
Plug '2072/PHP-Indenting-for-VIm' "PHP 縮排調整
Plug 'rayburgemeestre/phpfolding.vim' "PHP function 自動收合

" Initialize plugin system
call plug#end()
