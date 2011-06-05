let g:quickrun_config = {}
let g:quickrun_no_default_key_mappings = 1

nmap <SPACE>r <Plug>(quickrun)

au FileType haskell source ~/.vim/modules/quickrun/haskell.vim
