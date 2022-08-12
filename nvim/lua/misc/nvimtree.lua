-- Options 
-- https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt

-- Keymappings
-- https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt

local icons = { error = "E", warning = "W", hint = "H" , info = "I" }

require("nvim-tree").setup( {
	open_on_setup = true,
	diagnostics = {
		icons = icons,
		enable = true,
		show_on_dirs = false,
	},
	filters = {
		dotfiles = false,
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	hijack_cursor = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		side = "left",
		hide_root_folder = false
	},
	renderer = {
		highlight_git = false,
		root_folder_modifier = ":~",

		indent_markers = {
			enable = true
		},

		icons = {
			webdev_colors = false,
			show = {
				git = true,
				file = false,
				folder = false,
				folder_arrow = true,
			},
		},
	},
})
