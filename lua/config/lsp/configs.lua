local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local lspconfig = require("lspconfig")

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

local servers = { "jsonls", "lua_ls", "tsserver", "eslint", "cssls", "cssmodules_ls", "svelte", "tailwindcss" }
mason_lspconfig.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("config.lsp.handlers").on_attach,
    capabilities = require("config.lsp.handlers").capabilities,
  }
  if server == "lua_ls" then
    local lua_opts = require("config.lsp.settings.lua_ls")
    opts = vim.tbl_deep_extend("force", lua_opts, opts)
  end
  lspconfig[server].setup(opts)
end
