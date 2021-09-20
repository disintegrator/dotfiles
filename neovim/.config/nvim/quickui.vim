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

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

noremap <leader>m :call quickui#menu#open()<cr>
