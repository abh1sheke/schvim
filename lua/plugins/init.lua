require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require("plugins.configs.treesitter")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.configs.telescope")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("plugins.configs.indent-blankline")
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = {
      "TroubleToggle",
      "TroubleToggle workspace_diagnostics",
      "TroubleToggle document_diagnostics",
      "TroubleToggle quickfix",
      "TroubleToggle loclist",
      "TroubleToggle lsp_references",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    ft = { "gitcommit", "diff" },
    init = function()
      -- load gitsigns only when a git file is opened
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
        callback = function()
          vim.fn.system("git -C " .. '"' .. vim.fn.expand("%:p:h") .. '"' .. " rev-parse")
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
            vim.schedule(function()
              require("lazy").load({ plugins = { "gitsigns.nvim" } })
            end)
          end
        end,
      })
    end,
    opts = function()
      return require("plugins.configs.gitsigns")
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    init = function()
      require("plugins.configs.lualine")
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  -- Lsp stuff
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = { disable_filetype = { "TelescopePrompt", "vim" } },
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
        opts = function()
          require("plugins.configs.mason")
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = require("plugins.configs.mason"),
      },
      -- Autocompletion
      {
        "hrsh7th/nvim-cmp",
        config = function()
          require("plugins.configs.cmp")
        end,
      },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-path" },
      {
        "L3MON4D3/LuaSnip",
        build = vim.fn.has("win32") ~= 0 and "make install_jsregexp" or nil,
        dependencies = {
          "rafamadriz/friendly-snippets",
          "benfowler/telescope-luasnip.nvim",
        },
        config = function(_, opts)
          if opts then
            require("luasnip").config.setup(opts)
          end
          vim.tbl_map(function(type)
            require("luasnip.loaders.from_" .. type).lazy_load()
          end, { "vscode", "snipmate", "lua" })
          require("luasnip").filetype_extend("javascriptreact", { "html", "javacript" })
          require("luasnip").filetype_extend("typescriptreact", { "html", "javascript" })
        end,
      },
    },
  },
  { "saadparwaiz1/cmp_luasnip" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.configs.null-ls")
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- Themes
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "auto",
      })
      vim.cmd([[colorscheme rose-pine]])
    end,
  },
  { "xiyaowong/transparent.nvim" },
})

require("plugins.configs.lsp-zero")
