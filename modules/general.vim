" == General Settings

" I want to have syntax colors by default
syntax enable
set background=dark
set t_Co=256

if has("gui_running")
  colorscheme wombat
else
  colorscheme wombat256
endif

" If in mac, use Monaco and put size 14 to the font
if has("gui_macvim")
  set guifont=Monaco:h14
endif

" If on mac, we want the clipboard to work with vim
" without any problems
if has("macunix")
  set clipboard=unnamed
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
" Allow backspace over autoindent, linebreaks and over the start of insert
set backspace=indent,eol,start

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
" We want a margin line on the right
set colorcolumn=+1

" A bunch of settings all wrapped up together
" :help formatoptions for more info
set formatoptions=qrnl

" We want elements to be foldable by their syntax
" this way is more likely to work out of the box
set foldmethod=manual

" We don't want all folds to be closed all the start
" let's set a minimum of 2 level opens
set foldlevel=19

" ==
" == Helping The old vices & annoying mistakes
" We don't want anything to do with the mundane way
" of moving between characters
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
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

" We want to have a similar keystroke like D but for yanking
nnoremap Y y$

" The <LEADER> keyword, is synonym of ,
let mapleader=','
let maplocalleader = ';'


" Avoid crazy indentation when pasting on terminal
set pastetoggle=<F3>

" Add new buffer
nnoremap <LEADER>a :<C-u>new<CR>

" Moving the q: functionality to ;;
nnoremap ;; q:
nmap q: <nop>

" After auto-indent, if I press ESC please don't
" remove the auto-indent
imap <CR> <CR> <BS>

" Show hidden characters by default
set list!

