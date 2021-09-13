" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Show all diagnostics
nnoremap <silent> <leader>a :<C-u>CocList diagnostics<cr>
