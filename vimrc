" == Initial Setup (Pathogen)
filetype off
call pathogen#runtime_append_all_bundles()
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

" ==
" == NERDTree Config
nmap <LEADER>p :NERDTreeToggle<CR>

" ==
" == Haskell Settings
" Highlight all the different types please
let g:hs_highlight_booleans = 1
let g:hs_highlight_types = 1
let g:hs_highlight_more_types = 1

