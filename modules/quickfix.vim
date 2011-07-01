nmap <LEADER>b :<C-u>make<CR>

au FileType qf nnoremap <silent><buffer> q :<C-u>cclose<CR>
au QuickFixCmdPost make call OpenQuickFixBuffer()

" Depends on MarkLines in order to work
" see:
"  * modules/marklines.vim
"  * :help marklines
function! HighlightQuickFixLines(qflist)
  if exists('g:marklines_loaded') && !empty(a:qflist)
    let l:curPos = getpos('.')
    " We save the cursor position
    for qferror in a:qflist
      exec qferror.lnum . 'MarkLinesOn'
    endfor
    " we keep the cursor in the same place
    call setpos('.', l:curPos)
  endif
endfunction

function! OpenQuickFixBuffer()
  %MarkLinesOff
  let l:qflist = getqflist()
  if !empty(l:qflist)
    call RemoveFromStatusLine('\[Syntax Ok\]')
    call RemoveFromStatusLine('%#error#\[Make failed\]%\*')
    call AppendToStatusLine('%#error#\[Compile Error\]%\*')
    call HighlightQuickFixLines(l:qflist)
    copen
  elseif v:shell_error > 0
    call RemoveFromStatusLine('\[Syntax Ok\]')
    call RemoveFromStatusLine('%#error#\[Compile Error\]%\*')
    call AppendToStatusLine('%#error#\[Make failed\]%\*')

  else
    call RemoveFromStatusLine('%#error#\[Compile Error\]%\*')
    call RemoveFromStatusLine('%#error#\[Make failed\]%\*')
    call AppendToStatusLine('\[Syntax Ok\]')
    cclose

  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType haskell,cabal :source ~/.vim/modules/quickfix/haskell.vim 

