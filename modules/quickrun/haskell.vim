" NOTE: b:cabalFilePresent is defined by QuickFix, so you need
" to load that module first on vimrc.
"
" We are going to remap <LEADER>r to run the haskell/test
" type on QuickRun
if exists('b:cabalFilePresent') && b:cabalFilePresent &&
      \ filereadable(glob(b:currentCabalPath . '/*-testsuite.cabal'))

  if match(expand('%'), '^suite/\(.\+\)/Test\(.\+\)\?$') >= 0
    let s:currentFile =
          \ substitute(expand('%'), '^suite/\(.\+\)/Test\(.\+\)\?$', '\1', '')
    let s:runCommand =
          \ 'dist/build/testsuite/testsuite --plain -t ' . s:currentFile
  else
    let s:runCommand = 'dist/build/testsuite/testsuite --plain'
  endif

  " We define a quickrun for testsuite
  let g:quickrun_config['haskell/test'] = {
        \ 'exec': [s:runCommand]
        \ }

  " Run the haskell/test mode, and put the cursor into the buffer
  nnoremap <buffer><LEADER>r :QuickRun haskell/test -mode n -into 1<CR>

endif
