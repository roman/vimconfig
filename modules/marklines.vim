let g:marklines_highlight = "ErrorMsg"
let g:marklines_noautomap = 1

function! s:ClearAllHighlights()
  let l:curPos = getpos('.')
  %MarkLinesOff
  call setpos('.', l:curPos)
endfunction

nnoremap <silent> <LEADER><SPACE>e :call <SID>ClearAllHighlights()<CR>

