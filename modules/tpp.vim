au FileType tpp :call LoadTPP()
au FileType int-tpp :call LoadTPPPresentation()

function! LoadTPP()
  nmap <silent> <LEADER>r :call RunTPP()<CR>
endfunction!

function! RunTPP() 
  let l:currentFile = expand('%')
  let l:args = 'tpp ' . l:currentFile
  call vimshell#execute_internal_command(
        \ 'iexe', vimproc#parser#split_args(l:args), { 'stdin' : '', 'stdout' : '', 'stderr' : '' },
        \ { 'is_interactive' : 0, 'is_single_command' : 1 })
  let b:interactive.is_close_immediately = 1
endfunction

function! LoadTPPPresentation()
  setl nonu
  nmap <buffer> <silent> <left>  :call TPPPrevSlide()<CR>
  imap <buffer> <silent> <left>  <ESC>:call TPPPrevSlide()<CR>
  nmap <buffer> <silent> <right> :call TPPNextSlide()<CR>
  imap <buffer> <silent> <right>  <ESC>:call TPPNextSlide()<CR>
  nmap <buffer> <silent> q :call TPPQuitSlide()<CR>
  imap <buffer> <silent> q <ESC>:call TPPQuitSlide()<CR>
endfunction

function! TPPNextSlide()
  "try
    call vimshell#interactive#send_string(" ")
  "catch
  "endtry
endfunction

function! TPPPrevSlide()
  "try
    call vimshell#interactive#send_string("b")
  "catch
  "endtry
endfunction

function! TPPQuitSlide()
  "try
    call vimshell#interactive#send_string("q")
  "catch 
  "endtry
endfunction


