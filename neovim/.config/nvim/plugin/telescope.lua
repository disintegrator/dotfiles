local telescope = require('telescope')

local mapopts = { silent = true, noremap = true }

vim.api.nvim_set_keymap('n', '<Leader>p', '<cmd>lua require("telescope.builtin").find_files()<cr>', mapopts)
vim.api.nvim_set_keymap('n', '<Leader>o', '<cmd>lua require("telescope.builtin").git_files()<cr>', mapopts)
vim.api.nvim_set_keymap('n', '<Leader>s', '<cmd>lua require("telescope.builtin").live_grep()<cr>', mapopts)

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
})

telescope.load_extension('fzf')
