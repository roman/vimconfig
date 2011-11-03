" Highlight all the different types please
let g:hs_highlight_booleans = 1
let g:hs_highlight_types = 1
let g:hs_highlight_more_types = 1

" Automatically arrange imports in multilines when 
" import definition is really long
inoremap <silent>, <ESC>:call <SID>hsArrangeImports(',')<CR>a
inoremap <silent>) <ESC>:call <SID>hsArrangeImports(')')<CR>a

""""""""""""""""""""
"" hsArrengeImports + helpers

function! s:nextLine()
  if line('.') == line('$')
    return line('$')
  else
    return line('.') + 1
  endif
endfunction

function! s:isImportLine(importLine)
  return len(a:importLine) > 79 &&  
        \ match(a:importLine, 'import') == 0
endfunction

function! s:appendImport(importToken, sep)
  let l:lineNr = s:nextLine()
  call append(l:lineNr, ["  " . a:sep . a:importToken])
  call cursor(l:lineNr + 1, col('1'))
endfunction

function! s:appendClosingChar(chr)
  let l:lineNr = s:nextLine()
  if a:chr == ","
    call append(l:lineNr, "  , ")
    call cursor(l:lineNr + 1, col('$'))
  else
    call append(l:lineNr, "  )")
    call cursor(l:lineNr + 1, col('$') - 1)
  endif
endfunction

function! s:appendImports(importLine, chr)
  let l:importLines = split(a:importLine, ',')
  call s:appendImport(l:importLines[0], '  ')
  for l:line in l:importLines[1:]
    let l:strippedLine = substitute(l:line, '^\s\+\(.\+\)\s\+$', '\1', '')
    call s:appendImport(l:strippedLine, ',')
  endfor
  call s:appendClosingChar(a:chr)
endfunction

function! s:hsArrangeImports(chr)
  let l:current = getline('.')
  let l:pre = l:current[0:col('.') - 1]
  let l:post = l:current[col('.'):]
  if s:isImportLine(l:current)
    let l:start_pos = match(l:current, '(') + 1
    call setline(line('.'), l:current[0 : (l:start_pos - 1)])
    call s:appendImports(l:current[(l:start_pos):], a:chr)
  else
    call setline(line('.'), l:pre . a:chr . l:post)
    call search(a:chr, 'ce', line('.'))
  endif
endfunction

""""""""""""""""""""

