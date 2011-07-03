" When on a Haskell File, we want QuickFix to run
" cabal if possible, if a cabal file is not present
" then we will run the file as the Main

function! FindCabalDirectory()
  if !exists('b:cabalFilePresent')
    " We start from the path of the file
    let b:currentCabalPath = expand('%:h')
    " If current path is not an absolute path
    " then make it one
    if match(b:currentCabalPath, '^/') < 0
      let b:currentCabalPath = getcwd() . "/" . b:currentCabalPath
    endif

    " Initializing the variable that checks if a cabal file
    " is present on the current path
    let b:cabalFilePresent = 
            \ filereadable(glob(b:currentCabalPath . '/*.cabal')) 
    " Lookup cabal files in all subdirectories
    while !b:cabalFilePresent && !empty(b:currentCabalPath)
      " we go one level up
      let b:currentCabalPath = 
            \ substitute(b:currentCabalPath, '\(.*\)/\(.\+\)$', '\1', '')
      let b:cabalFilePresent = 
            \ filereadable(glob(b:currentCabalPath . '/*.cabal'))
    endwhile
  endif

  if exists('b:currentCabalPath')
    " On this buffer only
    " Change the current directory where the cabal file is
    exec "lcd " . b:currentCabalPath
  endif
endfunction

au BufEnter *.hs call FindCabalDirectory()

" We have to call it the first time
call FindCabalDirectory()
if b:cabalFilePresent
  " We create a shortcut to run 'cabal configure'
  nnoremap <buffer> <LEADER>c :<C-u>! cabal configure<CR>

  " if the cabal file is a testsuite, run also the tests
  let &l:makeprg = "cabal build"

else
  " We compile the current file as the Main module
  let s:currentFile = expand('%')
  if !exists('b:qfOutputdir')
    let b:qfOutputdir = tempname()
    call mkdir(b:qfOutputdir)
  endif
  let &l:makeprg = 'ghc --make % -outputdir ' . b:qfOutputdir

endif

setl errorformat=
                 \%-Z\ %#,
                 \%W%f:%s:%c:\ Warning:\ %m,
                 \%E%f:%s:%c:\ %m,
                 \%E%f:%l:%c:,
                 \%E%>%f:%s:%c:,
                 \%+C\ \ %#%m,
                 \%W%>%f:%s:%c:,
                 \%+C\ \ %#%tarning:\ %m,
                 \cabal:\ %m,
                 \%-G%.%#


