" ==
" == Spaces/Tabs Manegement
" === Defaults for all file types
set ts=2 sw=2 sts=2 expandtab

" Methods that will set the same space for all different
" space attributes..
command! -nargs=* Stab call <SID>Stab()

" This is the function you need to call on the vim env
" :Stab
function! s:Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth =')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts  = l:tabstop
    let &l:sw  = l:tabstop
  endif
  call s:SummarizeTabs()
endfunction

" Private method that gets called to display
" the final values
function! s:SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" === Spaces for each type of file
if has("autocmd")
  filetype on
  " Syntax of these languages is very picky over tabs vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
endif

" === Removing trailing spaces 
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position
  let _s=@/
  let l = line(".") 
  let c = col(".")
  " Do what you gotta do
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" === Indentation using TextMate like commands
vmap <C-[> <gv
vmap <C-]> >gv

" ==
" == Invisible keys customization
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

