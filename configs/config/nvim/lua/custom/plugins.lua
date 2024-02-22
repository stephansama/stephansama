local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    event = "BufWritePre",
    config = function()
      require "custom.configs.conform"
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  -- Rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    event = "BufReadPost",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.rustaceanvim"
    end,
  },
  -- https://github.com/Saecki/crates.nvim?tab=readme-ov-file
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require("lsp-inlayhints").setup {
        -- config as code
      }
    end,
  },
  -- AI
  { "TabbyML/vim-tabby", lazy = false },
  {
    "themaxmarchuk/tailwindcss-colors.nvim",
    config = function()
      require("tailwindcss-colors").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "gennaro-tedesco/nvim-jqx",
    ft = { "json", "yaml" },
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "custom.configs.obsidian"
    end,
  },
  {
    "folke/todo-comments.nvim",
    ft = "*,!nvdash",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  { "ellisonleao/dotenv.nvim" },
  { "mbbill/undotree", lazy = false },
  {
    "mg979/vim-visual-multi",
    lazy = false,
    init = function()
      require "custom.configs.vvm"
    end,
  },
  {
    "mattn/emmet-vim",
    ft = { "html", "astro", "svelte", "typescriptreact", "tsx", "javascriptreact", "jsx" },
  },
  -- TODO figure out
  -- {
  --   "mfussenegger/nvim-dap",
  --   lazy = true,
  --   dependencies = {
  --     "rcarriga/nvim-dap-ui",
  --     -- lazy spec to build "microsoft/vscode-js-debug" from source
  --     {
  --       "microsoft/vscode-js-debug",
  --       version = "1.x",
  --       build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>d",
  --       function()
  --         require("dap").toggle_breakpoint()
  --       end,
  --     },
  --     {
  --       "<leader>c",
  --       function()
  --         require("dap").continue()
  --       end,
  --     },
  --   },
  --   config = function()
  --     require "custom.configs.debugger"
  --   end,
  -- },
}

return plugins
