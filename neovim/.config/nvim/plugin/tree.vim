lua <<EOF
require("nvim-tree").setup({
  auto_close = true,
  update_focused_file = {
    enable = true,
  },
})
EOF

nnoremap <silent> <leader>n <cmd>NvimTreeToggle<cr>
