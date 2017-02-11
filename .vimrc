set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/supertab'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

" set status line
set laststatus=2
" enable powerline-fonts
let g:airline_powerline_fonts = 1
" enable tabline
"let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
"let g:airline#extensions#tabline#buffer_nr_show = 1

" Statusline

let g:currentmode={
            \ 'n'  : 'N ',
            \ 'no' : 'N·Operator Pending ',
            \ 'v'  : 'V ',
            \ 'V'  : 'V·Line ',
            \ '^V' : 'V·Block ', 
            \ 's'  : 'Select ',
            \ 'S'  : 'S·Line ',
            \ '^S' : 'S·Block ',
            \ 'i'  : 'I ',
            \ 'R'  : 'R ',
            \ 'Rv' : 'V·Replace ',
            \ 'c'  : 'Command ',
            \ 'cv' : 'Vim Ex ',
            \ 'ce' : 'Ex ',
            \ 'r'  : 'Prompt ',
            \ 'rm' : 'More ',
            \ 'r?' : 'Confirm ',
            \ '!'  : 'Shell ',
            \ 't'  : 'Terminal '
            \}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=008'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=005'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004'
  else
    exe 'hi! StatusLine ctermfg=006'
  endif

  return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
"set statusline+=%8*\ [%n]                                " buffernr
set statusline+=%5*\ %{GitInfo()}                        " Git Branch name
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}             " Syntastic errors
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
"set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)"

hi User1 ctermfg=007
hi User2 ctermfg=008
hi User3 ctermfg=008
hi User4 ctermfg=008
hi User5 ctermfg=white
hi User7 ctermfg=144
hi User8 ctermfg=223
hi User9 ctermfg=007

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" Line
set cursorline
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
hi CursorLine   cterm=NONE ctermbg=NONE ctermfg=NONE
