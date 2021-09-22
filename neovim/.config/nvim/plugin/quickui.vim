call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&Code', [
            \ [ 'Go to &definition', 'exec "normal \<Plug>(coc-definition)"' ],
            \ [ 'Go to &type definition', 'exec "normal \<Plug>(coc-type-definition)"' ],
            \ [ 'Go to &implementation', 'exec "normal \<Plug>(coc-implementation)"' ],
            \ [ 'Find &references', 'exec "normal \<Plug>(coc-references)"' ],
            \ [ 'Re&name', 'exec "normal \<Plug>(coc-rename)"' ],
            \ [ '&Show documentation', 'ShowDocumentation' ],
            \ ])

call quickui#menu#install('&Debug', [
            \ [ '&Run', 'DAPContinue' ],
            \ [ 'Sto&p', 'DAPStop' ],
            \ [ 'Toggle &breakpoint', 'DAPToggleBreakpoint' ],
            \ [ 'Lo&gging breakpoint', 'DAPLogBreakpoint' ],
            \ [ '&Conditional breakpoint', 'DAPConditionalBreakpoint' ],
            \ [ '&List breakpoints', 'DAPListBreakpoints' ],
            \ [ '&Step over', 'DAPStepOver' ],
            \ [ 'Step &into', 'DAPStepInto' ],
            \ [ 'Step &out', 'DAPStepOut' ],
            \ [ 'Run &to cursor', 'DAPRunToCursor' ],
            \ ])

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

noremap <leader>m :call quickui#menu#open()<cr>
