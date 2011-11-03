nmap <LEADER>b :<C-u>make<CR>

au FileType qf nnoremap <silent><buffer> q :<C-u>cclose<CR>
au QuickFixCmdPost make call OpenQuickFixBuffer()

nnoremap ∆ :<C-u>cnext<cr>zvzz
nnoremap ˚ :<C-u>cprev<cr>zvzz
inoremap ∆ <ESC>:cnext<cr>zvzz
inoremap ˚ <ESC>:cprev<cr>zvzz

function! OpenQuickFixBuffer()
  " #NOTE: Remove all signs
  let l:qflist = getqflist()
  if !empty(l:qflist)
    call RemoveFromStatusLine('%#error#\[Make failed\]%\*')
    call AppendToStatusLine('%#error#\[Compile Error\]%\*')
    copen

  elseif v:shell_error > 0
    call RemoveFromStatusLine('%#error#\[Compile Error\]%\*')
    call AppendToStatusLine('%#error#\[Make failed\]%\*')

  else
    call RemoveFromStatusLine('%#error#\[Compile Error\]%\*')
    call RemoveFromStatusLine('%#error#\[Make failed\]%\*')
    cclose

  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType haskell,cabal :source ~/.vim/modules/quickfix/haskell.vim 

