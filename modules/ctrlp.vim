" I want the default behavior for c-p
"let g:ctrlp_map = "<C-p>"

" The working path is going to be the parent that
" has a .git/.bzr file
" Check help g:ctlrp_working_path_mode
let g:ctrlp_working_path_mode = 2

" Open buffer on vertical split
let g:ctrlp_split_window = 0

" Use caching for the love of god
let g:ctrlp_use_caching = 1

" Leave the cache
let g:ctrlp_clear_cache_on_exit = 0

" The cache of this plugin is going in the tmp folder of
" .vim
let g:ctrlp_cache_dir = $HOME . "/.vim/tmp"

" We are going to jumb to the oppened buffer
let g:ctrl_jump_to_buffer = 1


set wildignore=*/.git/*,*/.hg/*,*/dist/*,*/cabal-dev/*

nnoremap <C-f> :<C-u>CtrlP<CR>
nnoremap <C-b> :<C-u>CtrlPBuffer<CR>
