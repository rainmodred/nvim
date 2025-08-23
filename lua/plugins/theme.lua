return {
  -- { "nyoom-engineering/oxocarbon.nvim" },
  -- {
  --   "projekt0n/github-nvim-theme",
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("tokyonight")
  --   end,
  -- },
}
