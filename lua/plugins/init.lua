require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require("plugins.configs.treesitter")
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        config = function()
          require("plugins.configs.lspconfig")
        end,
      },
      {
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.api.nvim_command, "MasonUpdate")
        end,
        opts = function ()
          require("plugins.configs.mason")
        end
      },
      { 
	"williamboman/mason-lspconfig.nvim", 
	opts = require("plugins.configs.mason") 
      },
      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
	vim.cmd[[colorscheme tokyonight-night]]
    end,
  }
})

require("plugins.configs.lsp-zero");
