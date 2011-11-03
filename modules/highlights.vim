" Highlight long lines 
match Error '\%80c'
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Show WarningMsg as errors
hi! link Error WarningMsg
hi! link ColorColumn StatusLine
