let g:quickrun_config['haskell/test'] = {
      \ 'exec': ['cabal build', './runTestsAndCoverage.sh --plain']
      \ }

" If the current directory is a test folder
" and it holds the necessary files
" we are going to remap <LEADER>r to
" run the haskell/test type on QuickRun
let s:currentDirectory = getcwd()
let s:cabalFilePresent = filereadable(glob("*-testsuite.cabal"))
let s:runExecPresent   = filereadable("runTestsAndCoverage.sh")
if s:currentDirectory =~# "/test$" 
      \ && s:cabalFilePresent 
      \ && s:runExecPresent
  " Run the haskell/test mode, and put the cursor into the buffer
  nmap <LEADER>m :QuickRun haskell/test -mode n -into 1<CR>
  vmap <LEADER>m :QuickRun haskell/test -mode v -into 1<CR>
endif

