" Vim color file
" Maintainer:    Roman Gonzalez <romanandnreg at gmail dot com>
" Last Change:   2009 Aug 11

" For now this will only work on gvim

highlight clear
if exists("syntax_on")
  syntax reset
endif
set background=dark

let g:colors_name = "sunburst"

" GUI
hi lineNr      guifg=#888888 guibg=#DEDEDE ctermbg=248 ctermfg=240 gui=NONE
hi VertSplit   guifg=#DEDEDE guibg=#888888 ctermbg=240 ctermfg=248 gui=NONE
hi IncSearch   guibg=#16181A gui=NONE
hi Cursor      guibg=#DDDDDD ctermbg=240 ctermbg=240 gui=NONE
hi Search      guibg=#16181A guifg=NONE
hi MatchParen  guibg=#16181A guifg=#CE864B gui=NONE
hi Folded      guibg=#16181A guifg=NONE

" General
hi Normal      guifg=White   guibg=Black ctermfg=255 ctermbg=black
hi PreProc     guifg=#CE864B guibg=Black ctermfg=136
hi Include     guifg=#CE864B guibg=Black ctermfg=136
hi Identifier  guifg=#3387CC guibg=Black ctermfg=33 
hi Keyword     guifg=#CE864B guibg=Black ctermfg=136
hi Define      guifg=#CE864B guibg=Black ctermfg=136
hi Statement   guifg=#CE864B guibg=Black ctermfg=136
hi Function    guifg=#89BDFF guibg=Black ctermfg=75
hi Comment     guifg=#AEAEAE guibg=Black gui=italic ctermfg=246
hi SpecialChar guifg=#DAD085 guibg=Black
hi Directory   guifg=#3387CC guibg=Black
hi Special     guifg=#E28964 guibg=Black
hi PreCondit   guifg=#9B859D guibg=Black
hi link Conditional Keyword
hi link Type Identifier
hi SpecialComment guifg=#AEAEAE guibg=Black gui=bold
hi Type       guifg=White gui=NONE
hi Constant   guifg=#3387CC guibg=Black ctermfg=33
hi String     guifg=#65B042 guibg=Black ctermfg=112
hi Title      guifg=#FFFFFF guibg=Black
hi Todo       guifg=#FFFFFF guibg=Black gui=underline
hi Structure  guifg=#CE864B guibg=Black
hi Delimiter  guifg=#FFFFFF guibg=Black
hi NonText    guifg=#AEAEAE guibg=Black gui=italic ctermfg=246
hi SpecialKey guifg=#AEAEAE guibg=Black gui=italic ctermfg=246

" NERDTree 
hi link treeClosable Special
hi treeExecFile guifg=#AB2A1D guibg=Black
hi treeOpenable guifg=#DAD085 guibg=Black
hi treeLink guifg=#FD5FF1 guibg=Black

" LaTeX 
hi link texInputFile PreCondit
hi texSectionMarker guifg=#DAD085 guibg=Black
hi texStatement guifg=#DAD085 guibg=Black
hi link texSectionName Identifier
hi link texInputFile Identifier
hi link texSpecialChar Identifier

" Haskell 
hi ConId guifg=#3387CC guibg=Black gui=NONE
hi hsOperator guifg=#E28964 guibg=Black
hi hsStructure guifg=#E28964 guibg=Black gui=bold
hi hsTypeDef guifg=#E28964 guibg=Black gui=bold
hi hsImport guifg=#E28964 guibg=Black gui=bold
hi link hsCharacter String
hi link hsType Identifier
hi link hsStatement hsOperator

" Ruby 
hi rubyKeyword guifg=#DAD085 guibg=Black
hi link rubyStringDelimiter String

" Rails 
hi link rubyRailsUserClass ConId
hi rubyRailsMethod guifg=#DAD085 guibg=Black
hi rubyRailsTestMethod guifg=#DAD085 guibg=Black

" HTML
hi htmlTagName guifg=#89BDFF guibg=Black gui=NONE
hi htmlArg guifg=#CDA869 guibg=Black gui=NONE
hi link htmlSpecialTagName htmlTagName
hi link htmlEndTag htmlTagName

" Javascript
hi javaScriptFunction guifg=#99CF50 guibg=Black gui=NONE
hi javaScriptBraces guifg=White guibg=Black gui=NONE
hi javaScriptConditional guifg=#E28964 guibg=Black gui=NONE
hi link javaScriptIdentifier javaScriptFunction

" Haml
hi hamlDocType guibg=Black guifg=White gui=NONE
hi link hamlTag htmlTagName
hi hamlId guifg=#AB2A1D guibg=Black
hi link hamlIdChar hamlId
hi hamlClassChar guifg=#DAD085 guibg=Black gui=NONE
hi hamlClass guifg=#DAD085 guibg=Black gui=NONE
hi hamlRubyOutputChar guifg=White guibg=Black gui=NONE


