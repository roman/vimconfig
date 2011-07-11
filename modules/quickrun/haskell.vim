" If the current directory has a testsuite cabal
" then run the testsuite
"
" NOTE: This code depends on the cabalFilePresent variable
" defined on the quickfix/haskell.vim module

if exists('b:cabalFilePresent')

  " If the current cabal path is with testsuite
  " then configure the quickrun with cabal
  if filereadable(glob(b:currentCabalPath . '/*-testsuite.cabal'))

    let s:executablePath = './dist/build/testsuite/testsuite --plain -j 4'
    
    let g:quickrun_config['haskell/test'] = {
          \ 'exec': [s:executablePath]
          \ }

    nmap <LEADER>r :QuickRun haskell/test -mode n -into 1<CR>

  " Otherwise we restore the previous behaviour
  " for quickrun
  else

    nmap <LEADER>r <Plug>(quickrun)
  endif

endif

