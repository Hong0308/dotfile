"------ General Settings ---------------------------------------------------------------------------------------------

syntax on                             
let mapleader = ","                                         " Set leader key is comma
set encoding=UTF-8                                          " Set default encoding to UTF-8
set ff=unix                                                 " Set File Format(ff) to Unix

"" Search
set hlsearch                                                " Search highlighting
set incsearch                                               " Incremental search

"" Editing
set backspace=eol,start,indent                              " Controlling What theB Backspace Key Does
set smarttab                                                " Insert tabs on the start of a line according to context
set tabstop=4                                               " Number of spaces that a <Tab> in the file counts for
set autoindent                                              " Copy indent from current line when starting a new line
set copyindent                                              " Copy the previous indentation on autoindenting

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



"------ Visuals ------------------------------------------------------------------------------------------------------

set number                                                  " Display line numbers
set colorcolumn=120                                         " Display a ruler at a specific line
set t_Co=256                                                " 256 color mode
set showmatch                                               " Cursor shows matching ) and }
set background=dark                                         " Dark background

"" Font
" https://github.com/tonsky/FiraCode 
" https://github.com/powerline/powerline

"" Highlight
set cursorline                                              " Highlight the screen line of the cursor

"" Status line
set laststatus=2                                            " Open status line
set showmode                                                " Show current mode



"------ Keybinding ---------------------------------------------------------------------------------------------------

nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader><space> :nohlsearch<cr>

"" Tab change
map <S-H> gT
map <S-L> gt



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
