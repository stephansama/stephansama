local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

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
  "sqlls",
  -- systems
  -- "gopls",
  "dockerls",
  "clangd",
  -- c
  "cmake",
}

for _, lsp in ipairs(servers) do
  if lsp == "tailwindcss" then
    lspconfig[lsp].setup {
      capabilities = capabilities,
      on_attach = function(c, b)
        require("tailwindcss-colors").buf_attach(b)
        on_attach(c, b)
      end,
    }
    goto continue
  end
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  ::continue::
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
}

lspconfig.mdx_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "mdx", "md" },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
}
