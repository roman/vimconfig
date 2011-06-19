" This script will check if there is a custom
" .vimrc file in the root of the directory, if that 
" is the case it will run it

function SubprojectLoadVimrc()
  let l:rootPath = getcwd()
  let l:vimrcPresent = filereadable('.vimrc')

  " if the rootPath is not home, then load
  " the custom .vimrc, this way we avoid 
  " a permanent loading issue
  if l:rootPath != $HOME && l:vimrcPresent
    exec 'source ' . l:rootPath . '/.vimrc'
  endif

endfunction

call SubprojectLoadVimrc()
