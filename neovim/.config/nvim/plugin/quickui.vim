call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&Code', [
            \ [ 'Go to &definition', 'lua require("cyberdyne.lsp").definitions()' ],
            \ [ 'Go to &type definition', 'lua require("cyberdyne.lsp").type_definitions()' ],
            \ [ 'Go to &implementation', 'lua require("cyberdyne.lsp").implementations()' ],
            \ [ 'Find &references', 'lua require("cyberdyne.lsp").references()' ],
            \ [ 'Re&name', 'lua require("cyberdyne.lsp").rename()' ],
            \ [ '&Show documentation', 'lua require("cyberdyne.lsp").hover()' ],
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
