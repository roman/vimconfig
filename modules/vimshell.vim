map <LEADER>s :VimShell<CR>
map <LEADER>i :VimShellInteractive<CR>

function! Roman_vimshell_user_prompt()
  let s:user   = $USER
  let s:path   = fnamemodify(getcwd(), ":~")
  let s:host   = hostname()
  let s:branch = vimshell#vcs#info("[branch: %b]")
  return s:user . "@" . s:host . ": " . s:path . " " . s:branch
endfunction

let g:vimshell_user_prompt = 'Roman_vimshell_user_prompt()'
let g:vimshell_prompt = "$ "
