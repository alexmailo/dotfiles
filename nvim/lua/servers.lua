local cfg = require("lspconfig")
--local notify = require "notify"

local signs = { Error = "E", Warn = "W", Hint = "H" , Info = "I" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = true,

	float = {
		focusable = true,
		style = "minimal",
		border = "none",
		source = "always",
		header = "",
		prefix = "",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

function on_attach(server_name)
	print("Server " .. server_name .. " attached")
end

local servers = {
	"html", -- html
	"cssls", -- css
	"rust_analyzer", -- rust
	"clangd", -- c
	"vuels", -- vue
	"jsonls", -- json
	"yamlls", -- yaml
	"pyright", -- python
	"eslint", -- js tsx jsx ts
	"marksman", -- markdown
	"emmet_ls" -- emmet
}

-- set up servers
for _, lsp in pairs(servers) do
	cfg[lsp].setup({
		on_attach = function()
			on_attach(lsp)
		end,
		capabilities = capabilities,
	})
end
