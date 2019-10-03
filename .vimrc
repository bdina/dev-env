"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bryan Dina's .vimrc <bryansdina@gmail.com>
"
" Version: 0.7
"
" Required Plugins:
"   - taglist.vim 4.5
"     URL: http://vim.sourceforge.net/scripts/script.php?script_id=273
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

" Setting the unnamed clipboard (for tmux compatibility)
set clipboard=unnamed


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu
set ruler "Always show current position
set cmdheight=2 "The commandbar height
set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set list "Display the control characters (things like tabs or eol)
set listchars=eol:.,tab:>.  "Change the token for 'eol' to '.' and 'tab' to '...>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable "Enable syntax highlighting

" Set font according to system
if has("mac")
    set gfn=Source\ Code\ Pro:h10
    set shell=/bin/bash
elseif has("win32")
    set gfn=Bitstream\ Vera\ Sans\ Mono:h10
elseif has("linux")
    set gfn=Monospace\ 10
    set shell=/bin/bash
endif

if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set t_Co=256
    set background=dark
    colorscheme desert 
else
    colorscheme delek
    set background=dark
endif

set nu "Display line numbers

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

" Persistent undo
try
    if has("win32")
        set undodir=C:\Windows\Temp
    else
        set undodir=~/.vim_runtime/undodir
    endif

    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTAGS INTEGRATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Look in the current directory for 'tags' file or work up the directory
" tree until one is found
set tags=tags;/

" Build tags (super fast) by pressing F8
map <F8> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Map alt-right/left to navigate forward/backward in the tags stack
map <M-left> <C-T>
map <M-right> <C-]>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" taglist plugin
" Configure the taglist plugin to use exhuberant ctags and bind the taglist
" window to F4
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TRICKERY CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TMUX CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('$TMUX')
    set ttymouse=xterm2
endif
