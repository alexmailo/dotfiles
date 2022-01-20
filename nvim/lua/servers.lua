require('telescope').setup{ 
	defaults = { 
		file_ignore_patterns = {"node_modules",".git", "target"}
	}
}
local cfg = require 'lspconfig'

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end 

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})


-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

cfg.clangd.setup{
	capabilities = capabilities,
}
cfg.pyright.setup{ 
	capabilities = capabilities,
	settings = {
		reportMissingImports = true,
		pyright  = {
			disableOrganizeImports = false,
		},
		python = {
			analysis = {
				autoImportCompletions = true
			}

		}

	}
}
cfg.rust_analyzer.setup({
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			completion = {
				autoimport = {
					enable = true
				}
			},
			inlayHints = {
				typeHints =  true

			}

		}

	}
})

require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
	indent = { 
		enable = true
	},
	folding = {
		enable = false
	}
}
--[[ vim.opt.foldmethod="expr"
vim.opt.foldexpr="nvim_treesitter#foldexpr()" ]]
