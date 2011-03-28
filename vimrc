" == Initial Setup (Pathogen)
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
set modelines=0

" == General Settings Module
source ~/.vim/modules/general.vim
" == Status Line Module
source ~/.vim/modules/statusline.vim
" == Search module
source ~/.vim/modules/search.vim
" == Window Management module
source ~/.vim/modules/window.vim
" == Tabs Management module
source ~/.vim/modules/tabs.vim
" == Tabular module
source ~/.vim/modules/tabular.vim
" == Vimshell module
source ~/.vim/modules/vimshell.vim
" == Neocomplcache module
source ~/.vim/modules/neocomplcache.vim

" ==
" == NERDTree Config
nmap <silent> \p :NERDTreeToggle<CR>
let NERDTreeIgnore=[
      \ '\~$', '\.swp$', 
      \ '\.hi$',
      \ '\.pyc',
      \ '\.o$', '\.out$',
      \ '\.class$',
      \ '\.nav$', '\.snm$', '\.toc$', '\.vrb$' 
      \ ]
let NERDTreeShowHidden = 0
let NERDTreeHighlightCursorline = 1
"let NERDTreeStatusline = 1

" ==
" == Haskell Settings
" Highlight all the different types please
let g:hs_highlight_booleans = 1
let g:hs_highlight_types = 1
let g:hs_highlight_more_types = 1

" ==
" == BuffExplorer Settings
nmap <silent> <C-b> :BufExplorer<CR>
let g:bufExplorerFindActive=1
let g:bufExplorerSplitBelow=1
let g:bufExplorerSortBye='mru'

" == 
" == Yankring Settings
let g:yankring_history_file='.vim_yankring_history'


" ==
" == Ack Settings
nmap <silent> <LEADER>a :Ack<CR>

" ==
" == Rainbow Parenthesis Settings
nmap <silent> <LEADER>r :RainbowParenthesesToggle<CR>


