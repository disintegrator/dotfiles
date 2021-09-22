let g:floaterm_autoclose = 1
let g:floaterm_height = 0.9
let g:floaterm_width = 0.9
let g:floaterm_position = 'bottomright'
let g:floaterm_opener = 'edit'

command! LazyGit FloatermNew lazygit
nnoremap <silent> <Leader>g <cmd>LazyGit<cr>
