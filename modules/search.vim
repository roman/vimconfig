" ==
" == Searching Customization

" We want to handle letter cases intelligently 
" if we search with a lower case, it will be uncase sensitive
" if we search with at least an upper case character, it works
" with sensitive search
set ignorecase
set smartcase

" We want substitution of regexp to apply to the whole line
" by default, not the first case only
" set gdefault

" We want to see the next matching pattern as we write
set incsearch
set showmatch
set hlsearch

nnoremap <silent> <LEADER><SPACE> :noh<CR>
nnoremap <TAB> %
vnoremap <TAB> %

