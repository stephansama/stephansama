local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- local util = require "lspconfig/util"

-- if you just want default config for the servers then put them in a table
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "bashls",
  "marksman",
  "mdx_analyzer",
  "yamlls",
  "jsonls",
  -- web
  "astro",
  "svelte",
  "html",
  "htmx",
  "cssls",
  "cssmodules_ls",
  "eslint",
  "tsserver",
  "tailwindcss",
  -- systems
  "gopls",
  "dockerls",
  "clangd",
  -- c
  "cmake",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- vim.lsp.inlay_hint.enable(true)

-- lspconfig.rust_analyzer.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"rust"},
--   root_dir = util.root_pattern("Cargo.toml"),
--   settings = {
--     ['rust-analyzer'] = {
--       cargo = {
--         allFeatures = true
--       },
--       diagnostics = {
--         enable = false;
--       }
--     }
--   }
-- }

--
-- lspconfig.pyright.setup { blabla}
