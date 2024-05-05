local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

local servers = {"tsserver", "tailwindcss", "eslint", "cssls"}

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true
      }
    }
  }
})

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup{
    on_attach = on_attach,
    capabilities = capabilities
  }
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true
      }
    }
  }
}
