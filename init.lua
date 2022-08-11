require("config.options")
require("config.keymaps")
require("config.plugins")
require("impatient")
require("config.cmp")
require("config.lsp")
require("config.treesitter")
require("config.telescope")
require("config.autopairs")
require("config.nvim-tree")
require("config.project")
require("config.which-key")
require("config.toggleterm")

-- Setup plugins
require("bufferline").setup({})
require("Comment").setup()
require("lualine").setup({
  options = {
    -- theme = "github_dark_default",
    theme = "tokyonight",
  },
})
-- require("github-theme").setup({
--   theme_style = "dark_default",
-- })
