local lspc = require('lspconfig')
local coq = require('coq')

function global_on_attach(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { noremap=true, silent=true }

	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

	buf_set_keymap('n', '\\D', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', '\\a', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', opts)
	buf_set_keymap('v', '\\a', ':<C-U>lua require("telescope.builtin").lsp_range_code_actions()<CR>', opts)
	buf_set_keymap('n', '\\d', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
	buf_set_keymap('n', '\\f', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
	buf_set_keymap('n', '\\i', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', opts)
	buf_set_keymap('n', '\\q', '<cmd>Trouble lsp_document_diagnostics<cr>', opts)
	buf_set_keymap('n', '\\r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '\\t', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', opts)
	buf_set_keymap('n', '\\wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '\\wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '\\wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
end

local M = {}

function M.setup_server(name, config)
	local current_on_attach = config.on_attach

	config.on_attach = function (...)
		global_on_attach(...)
		if current_on_attach ~= nil then
			current_on_attach(...)
		end
	end

	lspc[name].setup(coq.lsp_ensure_capabilities(config))
end

return M
