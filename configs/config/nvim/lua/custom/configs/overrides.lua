local M = {}

M.treesitter = {
  ensure_installed = {
    "astro",
    "rust",
    "vim",
    "lua",
    "html",
    "css",
    "json",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "mdx_analyzer",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "astro-language-server",
    "emmet-language-server",
    "emmet-ls",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- rust / go
    "gopls",
    -- "rust-analyzer",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
