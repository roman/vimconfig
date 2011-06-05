nmap <LEADER>b :<C-u>make<CR>:copen<CR>

au FileType haskell call QuickFixHaskell()

function! QuickFixHaskell()
  setl makeprg=cabal\ build
  setl errorformat+=%A%f:%l:\ %m,%A%f:%l:,%C%\\s%m,%Z
endfunction
