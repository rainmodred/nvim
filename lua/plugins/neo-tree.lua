-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  keys = {
    { "<leader>e", ":Neotree toggle right<CR>", desc = "NeoTree toggle", silent = true },
  },
  opts = {
    close_if_last_window = true,
    window = {
      position = "right",
    },
    filesystem = {
      use_libuv_file_watcher = true,
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
    },
  },
}
