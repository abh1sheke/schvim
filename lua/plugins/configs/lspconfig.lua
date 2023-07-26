local lspconfig = require "lspconfig"

local servers = {
    "html",
    "cssls",
    "rust_analyzer",
    "svelte",
    "tailwindcss",
    "gopls",
    "jsonls",
    "dockerls",
    "pyright",
    "eslint",
    "tsserver",
    "astro",
    "jsonls",
    "dockerls",
    "marksman",
}

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        on_attach = function(client, bufrn)
            if server == "tsserver" then
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end
        end,
        capabilities = capabilities,
    }
end

lspconfig.lua_ls.setup {
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
}
