lua <<EOF
require("indent_blankline").setup {
	buftype_exclude = {"terminal"},
	filetype_exclude = {"help"},
	char_list = { '|', '¦', '┆', '┊' },
	show_end_of_line = true,
	space_char_blankline = " ",
}
EOF
