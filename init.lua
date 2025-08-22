require("config.options")
require("config.keymaps")
require("config.autocmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end
---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
  --TODO: remove?
  -- "NMAC427/guess-indent.nvim", -- Detect tabstop and shiftwidth automatically

  require("plugins.fidget"),
  require("plugins.which-key"),
  require("plugins.fzf-lua"),
  require("plugins.lazydev"),
  require("plugins.lsp"),
  require("plugins.conform"),
  require("plugins.todo-comments"),

  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup()
    end,
  },
  require("plugins.treesitter"),
  require("plugins.treesitter-textobjects"),

  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.debug',
  require("plugins.cmp"),
  require("plugins.indent_line"),
  require("plugins.autopairs"),
  require("plugins.neo-tree"),
  require("plugins.gitsigns"),
  -- require("plugins.theme"),
  require("plugins.statusline"),
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
