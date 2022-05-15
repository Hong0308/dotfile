"------ General Settings ---------------------------------------------------------------------------------------------

syntax on
let mapleader = ","                                         " Set leader key is comma
set encoding=UTF-8                                          " Set default encoding to UTF-8
set ff=unix                                                 " Set File Format(ff) to Unix

"" Search
set wildignore=*.o,*~,*.pyc                                 " Ignore these files while expanding wild chars
set hlsearch                                                " Search highlighting
set incsearch                                               " Incremental search
set ignorecase                                              " Ignore case when searching
set smartcase                                               " Ignore case if search pattern is all lowercase
set magic                                                   " Search with regex

"" Editing
set backspace=eol,start,indent                              " Controlling What theB Backspace Key Does
set expandtab                                               " Use the appropriate number of spaces to insert a <Tab>
set smarttab                                                " Insert tabs on the start of a line according to context
set shiftwidth=4                                            " Number of spaces to use for each step of indent
set tabstop=4                                               " Number of spaces that a <Tab> in the file counts for
set autoindent                                              " Copy indent from current line when starting a new line
set copyindent                                              " Copy the previous indentation on auto-indenting

"" Word Wrap
set linebreak                                               " Make Vim break lines without breaking words
set wrap                                                    " Line wrapping

"" Folding
set foldnestmax=3                                           " Sets the maximum nesting of folds
set foldmethod=syntax                                       " The kind of folding
set foldenable                                              " Code folding
set foldcolumn=1                                            " Add a bit extra margin to the left

"" Backups
set history=50                                              " Keep 50 lines of command line history
set nobackup                                                " No *~ backup files
set nowritebackup                                           " Do not make a backup before overwriting a file
set noswapfile                                              " Do not use a swapfile for the buffer

"" Warnings
set noerrorbells                                            " No annoying sound on errors
set novisualbell                                            " No visual bell
set t_vb=                                                   " No beep or flash

"" Files
set autoread                                                " Auto read when file is changed from outside
filetype on                                                 " Enable filetype detection
filetype indent on                                          " Enable filetype-specific indenting
filetype plugin on                                          " Enable filetype-specific plugins
"
"" Autocomplete
set completeopt=longest,menu                                " Only insert the longest common text of the matches
set pumheight=10                                            " The maximum number of items to show in the popup menu
set wildmenu                                                " Wild char completion menu
set wildchar=<TAB>                                          " Start wild expansion in the command line using <TAB>
set complete=.,w,b,u                                        " Set our desired autocompletion matching.



"------ Visuals ------------------------------------------------------------------------------------------------------

set number                                                  " Display line numbers
set colorcolumn=120                                         " Display a ruler at a specific line
set t_Co=256                                                " 256 color mode
set showmatch                                               " Cursor shows matching ) and }
set background=dark                                         " Dark background
autocmd BufWritePre * :%s/\s\+$//e                          " Remove Windows's new line character, trailing whitespace

"" Font
" https://github.com/tonsky/FiraCode
" https://github.com/powerline/powerline

"" Highlight
set cursorline                                              " Highlight the screen line of the cursor

"" Status line
set laststatus=2                                            " Open status line
set showmode                                                " Show current mode
so ~/.vim/customize/status_line



"------ Keybinding ---------------------------------------------------------------------------------------------------

nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader><space> :nohlsearch<cr>

"" Tab change
map <S-H> gT
map <S-L> gt

"" Sort PHP use statements
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"" Ctags
nmap <Leader><C-]> <C-w><C-]><C-w>T



"------ Autocmd ------------------------------------------------------------------------------------------------------

"" Automatically source the Vimrc file on save
augroup autosorcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"" Return to last edit position when opening files
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line('$') |
\   exe "normal! g`\"" |
\ endif



"------ Plugins ------------------------------------------------------------------------------------------------------

so ~/.vim/plugins.vim

"" Color scheme
colorscheme gruvbox
colorscheme tender
colorscheme seoul256

"" NERDTree
nmap <Leader>n :NERDTreeToggle<cr>

"" CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"" Spelling check white list
let g:spelunker_white_list_for_user = []

"" Syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode':'passive'}

let g:syntastic_aggregate_errors = 1
let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]
let g:syntastic_php_phpmd_post_args = 'design,unusedcode'
let g:syntastic_php_phpcs_args = '--standard=PSR2 -n'

"" Super tab
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabClosePreviewOnPopupClose = 1

"" Auto import class (use)
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

"" PHP Coding Standards Fixer
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

"" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
