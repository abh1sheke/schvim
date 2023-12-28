local highlight = {
    "Primary",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "Primary", { fg = "#1f1d2e" })
end)

require("ibl").setup { indent = { char = "▏", highlight = highlight }, scope = { highlight = highlight } }
