" When on a Haskell File, we want QuickFix to run
" cabal if possible, if a cabal file is not present
" then we will run the file as the Main

" We start from the path of the file
let s:currentPath = expand('%:h')
" If current path is not an absolute path
" then make it one
if match(s:currentPath, '^/') < 0
  let s:currentPath = getcwd() . "/" . s:currentPath
endif

" Initializing the variable that checks if a cabal file
" is present on the current path
let s:cabalFilePresent = filereadable(glob(s:currentPath . '/*.cabal')) 

" Lookup cabal files in all subdirectories
while !s:cabalFilePresent && !empty(s:currentPath)
  " we go one level up
  let s:currentPath = substitute(s:currentPath, '\(.*\)/\(.\+\)$', '\1', '')
  let s:cabalFilePresent = filereadable(glob(s:currentPath . '/*.cabal'))
endwhile

if s:cabalFilePresent
  " We create a shortcut to run 'cabal configure'
  nnoremap <buffer> <LEADER>c :<C-u>! cabal configure<CR>

  " On this buffer only
  " Change the current directory where the cabal file is
  exec "lcd " . s:currentPath

  setl makeprg=cabal\ build

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
                 \%E%>%f:%s:%c:,
                 \%+C\ \ %#%m,
                 \%W%>%f:%s:%c:,
                 \cabal:\ %m,
                 \%+C\ \ %#%tarning:\ %m,
                 \%-G%.%#

