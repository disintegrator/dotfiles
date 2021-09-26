require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    'bash',
		'go',
		'html',
		'javascript',
		'json',
		'json5',
		'jsonc',
		'lua',
		'python',
		'ruby',
		'tsx',
		'typescript',
		'vim',
		'yaml',
  },
})

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
