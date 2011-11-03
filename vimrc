
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
" == Backup module settings
source ~/.vim/modules/backup.vim
" == Highlights and Matching module
source ~/.vim/modules/highlights.vim
" == Window Management module
source ~/.vim/modules/window.vim
" == Tabs Management module
source ~/.vim/modules/tabs.vim
" == Languages costumizations
source ~/.vim/modules/languages.vim
" == Tabular module
source ~/.vim/modules/tabular.vim
" == Vimshell module
source ~/.vim/modules/vimshell.vim
" == Neocomplcache module
source ~/.vim/modules/neocomplcache.vim
" == Haskell module
" source ~/.vim/modules/haskell.vim
" == Clojure module
source ~/.vim/modules/clojure.vim
" == Ref-Hoogle module
source ~/.vim/modules/hoogle.vim
" == Ctrlp module
source ~/.vim/modules/ctrlp.vim
" == Rainbow Parentheses module
source ~/.vim/modules/rainbowparentheses.vim
" == Nerd Tree module
source ~/.vim/modules/nerdtree.vim
" == Yankring module
source ~/.vim/modules/yankring.vim
" == QuickFix module
source ~/.vim/modules/quickfix.vim
" == QuickRun module
source ~/.vim/modules/quickrun.vim
" == Lusty module
source ~/.vim/modules/lusty.vim
" == Syntastic module
source ~/.vim/modules/syntastic.vim


