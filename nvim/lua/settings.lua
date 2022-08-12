--           _   _   _
--  ___  ___| |_| |_(_)_ __   __ _ ___
-- / __|/ _ \ __| __| | '_ \ / _` / __|
-- \__ \  __/ |_| |_| | | | | (_| \__ \
-- |___/\___|\__|\__|_|_| |_|\__, |___/
--                           |___/

vim.g.edge_style = "aura"
vim.g.tokyonight_style = "night"
vim.g.material_style = "deep ocean"
vim.g.tokyonight_transparent = true

vim.opt.iskeyword:append("-")
vim.opt.laststatus = 3
vim.opt.syntax = "on"
vim.opt.autoread = true
vim.opt.shell = "/bin/zsh"
vim.opt.swapfile = false
vim.opt.incsearch = true
vim.opt.inccommand = "nosplit"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.completeopt = "menu,menuone,noselect,preview"
vim.opt.hidden = true
vim.opt.cdhome = true
vim.opt.mouse = "a"
vim.opt.wildmode = "full:lastused"
vim.opt.wrap = false
vim.cmd("set path=~/.config/nvim/*/**")
vim.opt.relativenumber = true
vim.opt.number = true
vim.g.netrw_banner = false
vim.opt.cursorline = true
vim.opt.writebackup = false
vim.opt.expandtab = false
vim.opt.list = true
vim.opt.listchars = {
	trail = ".",
	tab = "➜ ",
}

vim.opt.termguicolors = true
vim.cmd("colorscheme tokyonight")
--
-- vim.cmd("hi Cursor guibg=cyan")
vim.cmd("hi EndOfBuffer guifg=bg")
