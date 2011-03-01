nmap <Leader>; Tabularize /::<CR>
nmap <Leader>- Tabularize /<-<CR>

inoremap <silent>:: <Esc>:call <SID>hsAlignSignature()<CR>a
inoremap <silent><- <Esc>:call <SID>hsAlignBinds()<CR>a

function! s:hsAlignSignature()
  let p = '^\s*\(,\s\)\?.*\s::\s.*$'
  let nl = getline('.')
  if (getline(line('.') - 1) =~# p ||  getline(line('.') + 1) =~# p)
    call setline(line('.'), nl . '::')
    Tabularize /::
  else
    call setline(line('.'), nl . '::')
  endif
  call search('$')
endfunction

function! s:hsAlignBinds()
  let p = '^\s*.*\s*<-\s.*$'
  let pre  = getline('.')[0:col('.') - 1]
  let post = getline('.')[col('.'):]
  call setline(line('.'), pre . '<-' . post)
  if ((getline(line('.') - 1) =~# p ||  getline(line('.') + 1) =~# p)) && 
     \strlen(substitute(pre, '\s\+', '', 'g')) > 0
    Tabularize/<-/l1
  endif
  call search('<-', 'ce', line('.'))
endfunction


