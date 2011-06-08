nmap <LEADER>b :<C-u>make<CR>

au BufReadPost quickfix nmap <silent> q :cclose<CR>
au QuickFixCmdPost make call OpenQuickFixBuffer()

function! OpenQuickFixBuffer()
  let qflist = getqflist()
  if empty(qflist)
    cclose
  else
    copen
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType haskell call QuickFixHaskell()

function! QuickFixHaskell()
  let l:cabalFilePresent = filereadable(glob('*.cabal'))
  if l:cabalFilePresent
    setl makeprg=cabal\ build
  else
    let l:currentFile = expand('%')
    let l:outputDir = tempname()
    " QUESTION: is this a good thing to do?
    " create a directory each time you compile?
    call mkdir(l:outputDir)
    let l:command = 'setl makeprg=ghc\ --make\ %' . 
                    \ '\ -outputdir\ ' . 
                    \ l:outputDir
                       
                      
    exec l:command
  endif 
  setl errorformat+=%A%f:%l:\ %m,%A%f:%l:,%C%\\s%m,%Z
endfunction
