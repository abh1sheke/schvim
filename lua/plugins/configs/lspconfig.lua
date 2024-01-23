local lspconfig = require("lspconfig")

local servers = {
	"html",
	"cssls",
	"rust_analyzer",
	"svelte",
	"tailwindcss",
	"gopls",
	"dockerls",
	"eslint",
	"tsserver",
	"astro",
	"dockerls",
	"ocamllsp",
	"clangd",
	"templ",
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
for _, server in ipairs(servers) do
	lspconfig[server].setup({
		on_attach = function(client, bufrn)
			if server == "tsserver" then
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end
		end,
		capabilities = capabilities,
	})
end

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

vim.filetype.add({ extension = { templ = "templ" } })
lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "templ" },
})

require("lspconfig").tailwindcss.setup({
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
					{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
				},
			},
		},
	},
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or "single"
	opts.max_width = opts.max_width or 80
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
