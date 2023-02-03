"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set all options to their default value before proceeding
"set all&

" exclude/reset VI compatibility.
set nocompatible

" keep 50 commands and 50 search patterns in the history, 50 is undo limit.
set history=100

" magic keeps regular expressions as grep, while very magic keeps as egrep.
set magic

" swapfiles are not useful at any way, thus disable swapfile.
set noswapfile

" do not save backup files.
set nobackup

" notimeout - wait for a key code forever.
" ttimeout - wait for a mapped key sequence to complete within ttimeoutlen.
set notimeout ttimeout
set timeoutlen=3000 ttimeoutlen=100     " in MilliSeconds



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" delete white space at following where insert mode started.
" indent    - allow backspacing over autoindent
" eol       - allow backspacing over line breaks
" start     - allow backspacing over the start of insert
set backspace=indent,eol,start

" Display the current cursor position in the lower right corner of the
" Vim window. But for now this is no londer used thanks to airline plugin.
"set ruler

" Display an incomplete vim command in the lower right corner of the VIM window
" This is no longer used thanks to AutoComplPop plugin
"set showcmd

" display line numbers.
set number

" display relative number to top and bottom.
set relativenumber

" width for line numbers.
set numberwidth=5

" do not wrap lines.
set nowrap

" do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" move cursor to first non-blank of the line when Vim move commands are used.
set startofline

" while searching in a file incrementally highlight matching characters.
set incsearch

" show the mode you are on the last line.
set showmode

" show matching words during a search.
set showmatch

" use highlighting when doing a search.
set hlsearch

" enable auto completion menu after pressing TAB.
set wildmenu

" make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" enable type file detection.
"filetype on

" enable plugins and load plugin for the detected file type.
filetype plugin on

" load an indent file for the detected file type.
filetype indent on

" turn on syntax highlighting.
syntax on

" choose any of these two.
set background=dark
"set background=light

" delete trailing white spaces at EOL when a file is saved.
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" locate the cursor in the last position when Vim is closed.
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "norm g`\"" |
\ endif

set colorcolumn=80
highlight ColorColumn ctermbg=red



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab and Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set tab size
set tabstop=4
set shiftwidth=4
set softtabstop=4

" use spaces instead of tabs
set expandtab

" works for C-like programs, but can also be used for other languages
set smartindent

" copy indent from current line when starting a new line.
" This should be on when smartindent is used.
set autoindent

" set indent for switch statement in C.
set cinoptions=:0



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding and Format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" determine the 'fileencoding' of a file being opened.
set fileencodings=utf-8,cp949,cp932,euc-kr,shift-jis,big5,ucs-2le,latin1

" represent data in memory
set encoding=utf-8

" use only unix fileformat, add "unix, dos" if you are a coward.
set fileformats=unix



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight all matches
set hlsearch

" not search wrap around the end of a file
set nowrapscan

" ignore case in search patterns
set ignorecase

" override ignorecase option if search pattern contains an uppercase character.
set smartcase

" show where pattern matches as it was typed so far.
set incsearch

" jump to one to the other using %, various character can be added.
set matchpairs+=<:>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load plugins when starting up
set loadplugins
filetype off                  " required
" C++ boilerplate template
augroup Templates
    autocmd!
    autocmd BufNewFile *.cpp 0r ~/.config/nvim/templates/practice.cpp
    autocmd BufNewFile contest.cpp 0r ~/.config/nvim/templates/contest.cpp
augroup END
call plug#begin("~/.config/nvim/plugged")
    " auto pairs for ( { [ ' " `
    Plug 'jiangmiao/auto-pairs'
    " replacement of set ruler
    Plug 'vim-airline/vim-airline'
    " tree style file manager
    Plug 'preservim/nerdtree'
    " multiple vim cursors using CTRL + N
    Plug 'terryma/vim-multiple-cursors'

    Plug 'ap/vim-css-color' " CSS Color Preview
    "Plug 'neoclide/coc.nvim'  " Auto Completion
    Plug 'preservim/tagbar' " Tagbar for code navigation

    Plug 'wakatime/vim-wakatime' " wakatime
call plug#end()