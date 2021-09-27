local lspc = require('lspconfig')
local coq = require('coq')

local M = {}

M.hover = vim.lsp.buf.hover
M.signature_help = vim.lsp.buf.signature_help
M.declaration = vim.lsp.buf.declaration
M.definitions = require("telescope.builtin").lsp_definitions
M.type_definitions = require("telescope.builtin").lsp_type_definitions
M.references = require("telescope.builtin").lsp_references
M.implementations = require("telescope.builtin").lsp_implementations
M.code_action = require("telescope.builtin").lsp_code_actions
M.range_code_action = require("telescope.builtin").lsp_range_code_actions
M.rename = vim.lsp.buf.rename
M.add_workspace_folder = vim.lsp.buf.add_workspace_folder
M.remove_workspace_folder = vim.lsp.buf.remove_workspace_folder
function M.list_workspace_folders() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end
function M.document_diagnostics() vim.api.nvim_command("Trouble lsp_document_diagnostics") end

function global_on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'K', '<cmd>lua require("cyberdyne.lsp").hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua require("cyberdyne.lsp").signature_help()<CR>', opts)

  buf_set_keymap('n', '\\D', '<cmd>lua require("cyberdyne.lsp").declaration()<CR>', opts)
  buf_set_keymap('n', '\\d', '<cmd>lua require("cyberdyne.lsp").definitions()<CR>', opts)
  buf_set_keymap('n', '\\f', '<cmd>lua require("cyberdyne.lsp").references()<CR>', opts)
  buf_set_keymap('n', '\\i', '<cmd>lua require("cyberdyne.lsp").implementations()<CR>', opts)
  buf_set_keymap('n', '\\t', '<cmd>lua require("cyberdyne.lsp").type_definitions()<CR>', opts)

  buf_set_keymap('n', '\\a', '<cmd>lua require("cyberdyne.lsp").code_action()<CR>', opts)
  buf_set_keymap('v', '\\a', ':<C-U>lua require("cyberdyne.lsp").range_code_action()<CR>', opts)
  buf_set_keymap('n', '\\q', '<cmd>lua require("cyberdyne.lsp").document_diagnostics()<cr>', opts)
  buf_set_keymap('n', '\\r', '<cmd>lua require("cyberdyne.lsp").rename()<CR>', opts)
  buf_set_keymap('n', '\\wa', '<cmd>lua require("cyberdyne.lsp").add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '\\wl', '<cmd>lua require("cyberdyne.lsp").list_workspace_folders()<CR>', opts)
  buf_set_keymap('n', '\\wr', '<cmd>lua require("cyberdyne.lsp").remove_workspace_folder()<CR>', opts)
end

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
