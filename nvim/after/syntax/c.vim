if get(g:, 'cpp_function_highlight', 1)
    syn match cUserFunction "\<\h\w*\ze\_s\{-}(\%(\*\h\w*)\_s\{-}(\)\@!"
    syn match cUserFunctionPointer "\%((\s*\*\s*\)\@<=\h\w*\ze\s*)\_s\{-}(.*)"
    hi def link cUserFunction Function
    hi def link cUserFunctionPointer Function
endif
