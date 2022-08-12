--[[ _                 
--  _ __ ___   __ _ _ __  _ __ (_)_ __   __ _ ___ 
-- | '_ ` _ \ / _` | '_ \| '_ \| | '_ \ / _` / __|
-- | | | | | | (_| | |_) | |_) | | | | | (_| \__ \
-- |_| |_| |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
--                 |_|   |_|            |___/      
-- ]]

-- nvim_set_keymap({mode}, {lhs}, {rhs}, {opts})
local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

map("n", "_", '"_', opts)

-- split windows.
map("n", "<space>vp", ":vsp<cr>", opts)
map("n", "<space>hp", ":sp<cr>", opts)

-- reload current file
map("n", "<space>rl", ":source %<cr>", {})

-- autoselect indentation
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- window movements
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- save the file
map("n", "<space>s", ":w<cr>", opts)

-- quit without saving
map("n", "<space>q", ":q!<cr>", opts)

--  Clipboard
map("n", "+", '"+', opts)

-- open tree
map("n", "<space>t", ":NvimTreeToggle <cr>", opts)

-- telescope
map("n", "st", "<cmd> lua require 'telescope.builtin'.colorscheme() <cr>", opts)
map("n", "sf", "<cmd> lua require 'telescope.builtin'.find_files() <cr>", opts)
map("n", "so", "<cmd> lua require 'telescope.builtin'.oldfiles() <cr>", opts)
map("n", "sb", "<cmd> lua require 'telescope.builtin'.current_buffer_fuzzy_find() <cr>", opts)
map("n", "sh", "<cmd> lua require 'telescope.builtin'.help_tags() <cr>", opts)
map("n", "sg", "<cmd> lua require 'telescope.builtin'.live_grep() <cr>", opts)
map("n", "sm", "<cmd> lua require 'telescope.builtin'.man_pages() <cr>", opts)
map("n", "sc", "<cmd> lua config()<cr>", opts)

-- lsp
map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
map("n", "<space>h", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "<space>pd", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "<space>nd", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

--  tabs
map("n", "<tab>", ":tabnext<cr>", opts)

-- resize windows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize +2<CR>", opts)
map("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- terminal
map("n", "<space>ef", ":ToggleTerm direction=float <cr>", opts)
map("n", "<space>ev", ":ToggleTerm direction=vertical <cr>", opts)
map("n", "<space>eh", ":ToggleTerm direction=horizontal <cr>", opts)
