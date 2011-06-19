" ==
" == Status Line (SL) Configuration
" The SL is a line in the lower section of the Window
" it shows useful information for the user
" + info => :help statusline

" If file format is not unix, show me a warning
function! HighlightNotUnix()
  " ff is a flag indicating wich format the file has
  " + info => :help ff
  if (&ff != 'unix')
    return '[' . &ff . ']'
  else
    return ''
  endif
endfunction

" If file format is not encoded with UTF-8, show me a warning
function! HighlightNotUTF8()
  " fenc is a flag indicating wich encoding the file has
  " + info => :help fenc
  if (&fenc != 'utf-8' && &fenc != '')
    return '[' . &fenc . ']'
  else
    return ''
  endif
endfunction

" Function that checks if there is spaces and tabas together
function! HighlightMixedIndenting()
  if !exists("b:statusline_tab_warning")
    let tabs = search('^t', 'nw') != 0
    let spaces = search('^ ', 'nw') != 0
    if tabs && spaces
      let b:statusline_tab_warning = '[mixed-indenting]'
    elseif (spaces && !&et) || (tabs && !&et)
      let b:statusline_tab_warning = '[&et]'
    else
      let b:statusline_tab_warning = ''
    endif
  endif
  return b:statusline_tab_warning
endfunction

" Check trailing spaces 
function! StatuslineTrailingSpaceWarning()
  if !exists('b:statusline_trailing_space_warning')
    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '[\s]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction

" Show syntax higlight group under the cursor
function! StatuslineCurrentHighlight()
  let name = synIDattr(synID(line('.'), col('.'), 1), 'name')
  if name != ''
    return '[' . name . ']'
  else 
    return ''    
  endif
endfunction

" Setting values on the left side
" First thing in line, the filename
set statusline=%f

" === Not Unix Highlighting
" this line will set the style of warningmsg on the following
" section of the statusline
set statusline+=%#warningmsg#
set statusline+=%{HighlightNotUnix()}
" we set the style of the statusline to the default again
set statusline+=%*

" === Not UTF-8 Highlight
" this line will set the style of warningmsg on the following
" section of the statusline
set statusline+=%#warningmsg#
set statusline+=%{HighlightNotUTF8()}
" we set the style of the statusline to the default again
set statusline+=%*

" show me if it is the help buffer
set statusline+=%h
" show me the filetype
set statusline+=%y
" show me if this file is read only
set statusline+=%r
" show me if the file has been modified
set statusline+=%m

" === Mixed Indenting Highlighting
" show me if there is mixed-indenting
" this line will set the sytle of error on the following section
" of the statusline
set statusline+=%#error#
set statusline+=%{HighlightMixedIndenting()}
" show me if there is trailing spaces before the eol
" set statusline+=%{StatuslineTrailingSpaceWarning()}
" we set the style of the statusline to the default again
set statusline+=%*

" Setting values on the right side
" ===  Highlight Group of current word
set statusline+=%=
set statusline+=%{StatuslineCurrentHighlight()}
" Cursor Column
set statusline+=%c,
" Cursor Line / Total Lines
set statusline+=%l/%L 
" Percent through line
set statusline+=\ %P 

" Always dipslay the status line
set laststatus=2

function! AppendToStatusLine(str) 
  if !exists('b:currentStatusLine')
    let b:currentStatusLine = &statusline
  endif
  let &l:statusline = substitute(b:currentStatusLine, '%y', '%y' . a:str, '')
endfunction

" Recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

