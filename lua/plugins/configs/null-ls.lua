local null_ls = require("null-ls")

null_ls.setup({
  debug = true,
  sources = {
    null_ls.builtins.formatting.prettierd.with {
      filetypes = {
        "html",
        "markdown",
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
    null_ls.builtins.formatting.stylua,
  },
})
