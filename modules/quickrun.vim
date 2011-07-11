let g:quickrun_config = {}
let g:quickrun_no_default_key_mappings = 1

nmap <LEADER>r <Plug>(quickrun)

au BufEnter *.hs,*.cabal source ~/.vim/modules/quickrun/haskell.vim
