local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {
  b.formatting.prettierd.with {
    filetypes = {
      "html",
      "markdown",
      "css",
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
      "json",
      "yaml",
      "svelte",
      "astro",
      "css",
    },
  },
  b.formatting.stylua,
}

null_ls.setup({
  debug = true,
  sources = sources,
})
