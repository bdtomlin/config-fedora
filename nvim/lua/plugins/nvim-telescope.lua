return {
	"nvim-telescope/telescope.nvim",
	opts = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--case-sensitive",
			"--hidden",
			"--glob=!.git/",
		},
		pickers = {
			buffers = {
				initial_mode = "normal",
				mappings = {
					n = {
						["d"] = "delete_buffer",
					},
				},
			},
			marks = {
				initial_mode = "normal",
				mappings = {
					n = {
						["d"] = "delete_mark",
					},
				},
			},
			registers = {
				initial_mode = "normal",
			},
		},
		defaults = {
			layout_strategy = "vertical",
			sorting_strategy = "ascending",
			layout_config = {
				prompt_position = "top",
			},
		},
	},
}
