local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    width = 60,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    width = 60,
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
  -- end
end

local function lsp_keymaps()
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration(), opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition(), opts)
  vim.keymap.set("n", "gh", vim.lsp.buf.hover(), opts)
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation(), opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references(), opts)
  vim.keymap.set("n", "gl", vim.diagnostic.open_float(), opts)
  vim.keymap.set("n", "<leader>lf", vim.lsp.buf.formatting_sync(), opts)
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action(), opts)
  vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next({ buffer = 0 }), opts)
  vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev({ buffer = 0 }), opts)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename(), opts)
  vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help(), opts)
  vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist(), opts)
end

M.on_attach = function(client)
  -- vim.notify(client.name .. " starting...")
  -- TODO: refactor this into a method that checks if string in list
  if client.name == "tsserver" or "sumneko_lua" or "eslint" then
    client.server_capabilities.document_formatting = false
  end
  lsp_keymaps()
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
