nmap <Space>V <Plug>(vimshell_split_switch)
nmap <Space>V <Plug>(vimshell_switch)

" TODO: 
" * Ask Uji how to improve this code to use
"   an s: as a prefix of the function
" * Remove the [%] from the g:vimshell_user_prompt
function! Roman_vimshell_user_prompt()
  let s:user   = $USER
  let s:path   = fnamemodify(getcwd(), ":~")
  let s:host   = hostname()
  let s:branch = vimshell#vcs#info("[branch: %b]")
  return s:user . "@" . s:host . ": " . s:path . " " . s:branch
endfunction

let g:vimshell_user_prompt = 'Roman_vimshell_user_prompt()'
let g:vimshell_prompt = "$ "
