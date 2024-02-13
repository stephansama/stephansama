local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

vim.g.rustaceanvim = {
  -- inlay_hints = {
  --   highlight = "NonText",
  -- },
  server = {
    on_attach = function(client, bufnr)
      require("lsp-inlayhints").on_attach(client, bufnr)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
  },
}
