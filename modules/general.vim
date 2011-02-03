" == General Settings
if has("gui_running")
  colorscheme sunburst
endif

" If in mac, use Monaco and put size 14 to the font
if has("gui_macvim")
  set guifont=Monaco:h12
endif

" We don't want to loose features because of compatibility
set nocompatible
" We want any kind of characters on the files _always_
set encoding=utf-8   
" We want to see the line numbers
set nu
" We want to have smart indentation on newlines 
set autoindent
" We want to know in which state we are (visual, replace, command)
set showmode
" We want to see the command we are executing
set showcmd
" allow vim to create hidden files without to much hassle
set hidden 
" We want to get suggestions out of the prompt, so we enable this
set wildmenu
set wildmode=list:longest
" We don't want any annoying sound when we are moving in invalid places
" is better to have a highlighted terminal for a sec
set visualbell
" We want to see what is the line of the cursor
" set cursorline
" Makes the vim rendering go faster
set ttyfast
" We want to see in which line,column we are standing on
set ruler
" TODO: Find out what is this all about
set backspace=indent,eol,start
" I want to have syntax by default
syntax on

" We want to see the relative numbers from the current line
" NOTE: For some reason this option doesn't work on linux
"set relativenumber

" We want to have an undofile where we have all the undos 
" stored, even after we close the file
" NOTE: For some reason this option doesn't work on linux
"set undofile

" == 
" == Long line handling
" We want long lines to be wrapped
set wrap
" We want them to be wrapped at the 80th char
set textwidth=79
" A bunch of settings all wrapped up together
" :help formatoptions for more info
set formatoptions=qrnl
" We want the line to be colored after passing 85
" chars, this way we know we are breaking formatting
" rules
"set colorcolumn=85

" We want elements to be foldable by their syntax
" this way is more likely to work out of the box
set foldmethod=syntax

" ==
" == Helping The old vices & annoying mistakes
" We don't want anything to do with the mundane way
" of moving between characters
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" move on the screen line, no the file line
nnoremap j gj
nnoremap k gk

" Remove completely the F1 binding, it is completely useless
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Keep the autosave feature whenever someone losses focus of the window
au FocusLost * :wa

" Make an easier way to go to command mode
inoremap jj <ESC>

" I want to have a similar keystroke like D but for yanking
map Y y$

" The <LEADER> keyword, is synonym of ,
let mapleader = ','


