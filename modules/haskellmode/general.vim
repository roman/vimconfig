" Highlight all the different types please
let g:hs_highlight_booleans = 1
let g:hs_highlight_types = 1
let g:hs_highlight_more_types = 1

" Needed for the quickcheck extension to work
au BufEnter *.hs compiler ghc

let g:ghc="/usr/bin/ghc"
let g:haskellmode_config_file="/modules/haskellmode/main.config"
let g:haddock_browser="open"
let g:haddock_indexfiledir="~/.vim/modules/haskellmode/"

