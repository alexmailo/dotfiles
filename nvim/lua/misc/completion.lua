local luasnip = require("luasnip")
local cmp = require("cmp")
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
	window = {
		completion = {
			side_padding = 0,
		}
	},
	mapping = {
	 ["<Tab>"] = cmp.mapping(function(fallback)
		  if cmp.visible() then
			cmp.select_next_item()
		  elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		  elseif has_words_before() then
			cmp.complete()
		  else
			fallback()
		  end
		end, { "i", "s" }),
	 ["<S-Tab>"] = cmp.mapping(function(fallback)
		  if cmp.visible() then
			cmp.select_prev_item()
		  elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		  else
			fallback()
		  end
		end, { "i", "s" }),

		["<Up>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	formatting = {
		fields = { "menu", "kind","abbr"   },
		
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s ", kind_icons[vim_item.kind] )
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = 'luasnip' },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
	-- REQUIRED FOR SOME REASON
	snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
})
