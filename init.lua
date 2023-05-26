--nvim tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.options")
require("config.plugins")
require("config.keymaps")

require("config.cmp")
require("config.lsp")
require("config.treesitter")
require("config.telescope")
require("config.autopairs")
require("config.nvim-tree")
require("config.which-key")
require("config.toggleterm")
require("config.neoscroll")
require("config.theme")

-- Setup plugins
require("bufferline").setup({})
require("Comment").setup({
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
require("lualine").setup({
  options = {
    -- theme = "github_dark_default",
    theme = "tokyonight",
  },
})
require("diffview").setup({})

function leave_snippet()
  if
    ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
    and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
    and not require("luasnip").session.jump_active
  then
    require("luasnip").unlink_current()
  end
end

-- stop snippets when you leave to normal mode
vim.api.nvim_command([[
    autocmd ModeChanged * lua leave_snippet()
]])

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
