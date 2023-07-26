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
    "lukas-reineke/indent-blankline.nvim",
    opts = function()
      return require("plugins.configs.indent-blankline")
    end,
    config = function(_, opts)
      require("indent_blankline").setup(opts)
    end
  },
  -- Lsp stuff
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      {
        "neovim/nvim-lspconfig",
      },
      {
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.api.nvim_command, "MasonUpdate")
        end,
        opts = function()
          require("plugins.configs.mason")
        end
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = require("plugins.configs.mason")
      },
      -- Autocompletion
      {
        "hrsh7th/nvim-cmp",
        config = function()
          require("plugins.configs.lspconfig")
        end,
      },
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup()
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
      vim.cmd [[colorscheme tokyonight-night]]
    end,
  }
})

require("plugins.configs.lsp-zero");
