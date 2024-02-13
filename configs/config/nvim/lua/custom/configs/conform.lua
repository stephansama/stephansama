--type conform.options
local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    -- web dev
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },

    -- systems
    -- rust = { "rustfmt" },
    go = { "gofmt" },
    sh = { "shfmt" },

    -- ["*"] = { { "prettierd", "prettierd" } },
  },
  lang_to_ext = {
    rust = "rs",
  },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  format_on_save = {
    -- I recommend these options. See :help conform.format for details.
    lsp_fallback = true,
    timeout_ms = 500,
  },
}

require("conform").setup(options)
