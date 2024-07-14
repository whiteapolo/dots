" Syntax highlighting for .mysh files

" Keywords
syntax keyword myshKeyword if for fi done echo cat fun end and or in elif else grep printenv
highlight link myshKeyword Keyword

" Highlight strings
syntax match myshString /".*"/
highlight link myshString String

" Highlight numbers
syntax match myshNumber /\v\d+(\.\d+)?/
highlight link myshNumber Number

" Highlight comments
syntax match myshComment "#.*$"
highlight link myshComment Comment

" Highlight variables
syntax match myshVariable /\v\$\w+/
highlight link myshVariable Identifier
