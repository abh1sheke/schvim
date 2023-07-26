local g = vim.g
local opt = vim.opt

g.mapleader = " "

opt.laststatus = 3
opt.showmode = false

opt.nu = true
opt.relativenumber = true

opt.clipboard = "unnamedplus"
opt.guicursor = ""
opt.cursorline = true

opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

opt.number = true
opt.numberwidth = 2
opt.ruler = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

opt.scrolloff = 4
opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

require("user.mappings")
