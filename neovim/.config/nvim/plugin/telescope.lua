local telescope = require('telescope')
local actions = require('telescope.actions')

local mapopts = { silent = true, noremap = true }

vim.api.nvim_set_keymap('n', '<Leader>p', '<cmd>lua require("telescope.builtin").find_files()<cr>', mapopts)
vim.api.nvim_set_keymap('n', '<Leader>o', '<cmd>lua require("telescope.builtin").git_files()<cr>', mapopts)
vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>lua require("telescope.builtin").live_grep()<cr>', mapopts)

telescope.setup({
  defaults = {
    file_ignore_patterns = {'.licenses/'},
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
      },
      n = {
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
      }
    },
  },
  pickers = {
    find_files = {
      find_command = {'fd', '--hidden', '--type', 'file'},
    },
    live_grep = {
      theme = 'ivy',
    },
    lsp_references = {
      theme = 'ivy',
    },
    lsp_implementations = {
      theme = 'ivy'
    },
    lsp_definitions = {
      theme = 'ivy'
    },
    lsp_type_definitions = {
      theme = 'ivy'
    },
    lsp_code_actions = {
      theme = 'cursor',
    },
    lsp_range_code_actions = {
      theme = 'cursor',
    },
    lsp_document_diagnostics = {
      theme = 'ivy',
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

telescope.load_extension('fzf')
