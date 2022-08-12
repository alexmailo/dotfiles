require("telescope").setup({
	defaults = {
		hidden = true,
		file_ignore_patterns = {
			"node_modules",
			".AppImage",
			".git",
			"target",
			".jpg",
			".mkv",
			".png",
			".mp4",
			".iso",
			".mp3",
			".pdf",
			".docx",
			".zip",
		},
		prompt_prefix = "🔍",
		theme = "ivy",
	},
	pickers = {
		find_files = {
			theme = "ivy",
			layout_config = {
				height = 0.6,
				prompt_position = "bottom",
			},
		},
		oldfiles = {
			theme = "ivy",
			layout_config = {
				height = 0.6,
				prompt_position = "bottom",
			},

		},
		colorscheme = {
			theme = "dropdown",
			previewer = false,
			layout_config = {
				prompt_position = "bottom",
			},
		},
	},
})

function config()
	local path = "/home/alex/.config/nvim/"
	require("telescope.builtin").find_files({ search_dirs = { path }, follow = true })
end
