" TODO: change shortcuts to something simpler
nmap ,q= :Tabularize /=<CR>
vmap ,q= :Tabularize /=<CR>

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>alignPipes()<CR>a

function! s:alignPipes()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Adding special tabulizations for Haskell source code
au FileType haskell source ~/.vim/modules/tabular/haskell.vim

