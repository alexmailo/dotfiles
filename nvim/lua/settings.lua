
--           _   _   _                 
--  ___  ___| |_| |_(_)_ __   __ _ ___ 
-- / __|/ _ \ __| __| | '_ \ / _` / __|
-- \__ \  __/ |_| |_| | | | | (_| \__ \
-- |___/\___|\__|\__|_|_| |_|\__, |___/
--                           |___/     

require('telescope').setup{ 
	defaults = { 
		file_ignore_patterns = {"node_modules",".git", "target"}
	}
}
vim.g.tokyonight_style = "night"
vim.opt.syntax = "on"
vim.opt.shell = "/bin/zsh"
vim.opt.swapfile = false
vim.opt.incsearch = true
vim.opt.inccommand  = "nosplit"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.g.edge_style = 'aura'
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.hidden = true
vim.opt.mouse = "a"
vim.opt.wildmode="full:lastused"
vim.opt.wrap=false
vim.cmd "set path=~/.config/nvim/*/**"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.g.netrw_banner = false
vim.cmd 'colorscheme gruvbox-material'

vim.opt.list = true
vim.opt.listchars = {
	tab = '➜ ',
	extends = '|'
}
-- vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
-- vim.cmd 'hi NormalNc guibg=NONE ctermbg=NONE'
-- vim.cmd 'hi StatusLine guibg=NONE ctermbg=NONE'
-- vim.cmd 'hi StatusLineNc guibg=NONE ctermbg=NONE'
