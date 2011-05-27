" To understand this settings, please refer to
" :help neocomplcache-variables
"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_enable_quick_match = 1
let g:neocomplcache_temporary_dir = $HOME . "/.vim/tmp/neocon"

" I don't want the buffer_complete noise in the autocomplete
if !exists("g:neocomplcache_plugin_completion_length")
  let g:neocomplcache_plugin_completion_length = {} 
endif
let g:neocomplcache_plugin_completion_length.buffer_complete = 4
