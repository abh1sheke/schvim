vim.cmd [[highlight IndentBlanklineIndent1 guifg=#26233a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#26233a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#26233a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#26233a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#26233a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#26233a gui=nocombine]]

return {
  filetype_exclude = {
    "help",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "",
  },

  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
}
