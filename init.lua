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

-- -- Setup plugins
require("bufferline").setup({})
require("Comment").setup()
require("ayu").setup({
  mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
  overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
})
require("lualine").setup({
  options = {
    theme = "github_dark_default",
  },
})
require("github-theme").setup({
  theme_style = "dark_default",
})
