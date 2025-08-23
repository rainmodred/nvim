return { -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VeryLazy", -- Sets the loading event to 'VimEnter'
  opts = {
    delay = 200,
    preset = "helix",
    spec = {
      { "<leader>s", group = "[S]earch" },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
    },
  },
}
