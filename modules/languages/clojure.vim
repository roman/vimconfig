let g:vimclojure_no_default_key_mappings = 1
" Overwriting default from VimShell
" In my personall setting I prefer lein repl rather than
" the clj binary
call vimshell#set_dictionary_helper(
    \ g:vimshell_interactive_interpreter_commands,
    \ 'clojure',
    \'lein repl')

exec ':RainbowParenthesesToggle'
exec ':RainbowParenthesesLoadSquare'
