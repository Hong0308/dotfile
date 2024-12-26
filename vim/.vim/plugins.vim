call plug#begin()

Plug 'tpope/vim-vinegar'                                       " Improve Vim's default netrw file browser
Plug 'preservim/nerdtree'                                      " A excellent file system explore
Plug 'ctrlpvim/ctrlp.vim'                                      " Rapidly switch from file to file
Plug 'tpope/vim-fugitive'                                      " The premier Vim plugin for Git

"" Editing
Plug 'jiangmiao/auto-pairs'                                    " Auto pair brackets, parens, quotes
Plug 'kamykn/spelunker.vim'                                    " Improves Vim's spell checking function
Plug 'vim-syntastic/syntastic'                                 " Syntax checking
Plug 'ervandew/supertab'                                       " Perform all your vim insert mode completions with Tab
Plug 'tpope/vim-surround'                                      " Easy edit 'surroundings': brackets, quotes, tags ...
Plug 'SirVer/ultisnips'                                        " The ultimate solution for snippets

" Visuals
Plug 'sheerun/vim-polyglot'                                    " For better syntax highlighting support
Plug 'Yggdroot/indentLine'                                     " Displaying thin vertical lines for code indented
Plug 'mhinz/vim-signify'                                       " Show differences with style
Plug 'ntpeters/vim-better-whitespace'                          " Better whitespace highlighting
Plug 'ap/vim-css-color'                                        " CSS color name highlighter

" Color scheme
Plug 'morhetz/gruvbox'                                         " Retro groove color scheme
Plug 'junegunn/seoul256.vim'                                   " Low-contrast Vim color scheme based on Seoul Colors
Plug 'jacoborus/tender.vim'                                    " A 24bit colorscheme for Vim, Airline and Lightline

"" PHP
Plug 'StanAngeloff/php.vim'                                    " PHP for Vim
Plug 'arnaud-lb/vim-php-namespace'                             " Auto use Class (namespace)
Plug 'stephpy/vim-php-cs-fixer'                                " Coding Style Check
Plug '2072/PHP-Indenting-for-VIm'                              " The official PHP indentation
Plug 'rayburgemeestre/phpfolding.vim'                          " function folding
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install()  }  }     " (Do)cumentation (Ge)nerator

call plug#end()
