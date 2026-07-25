vim.pack.add({
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/folke/todo-comments.nvim",
  {
    src = "https://github.com/lewis6991/gitsigns.nvim",
    version = vim.version.range("2.x"),
  },
  {
    src = "https://github.com/lukas-reineke/indent-blankline.nvim",
    version = vim.version.range("3.x"),
  },
  { src = "https://github.com/folke/which-key.nvim", version = vim.version.range("3.x") },
  { src = "https://github.com/nvim-mini/mini.surround", version = "stable" },
})

require("nvim-autopairs").setup()
require("gitsigns").setup({
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" },
  },
  signs_staged = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
  },
  on_attach = function(buffer)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
    end

    map("n", "]h", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gs.nav_hunk("next")
      end
    end, "Next Hunk")
    map("n", "[h", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gs.nav_hunk("prev")
      end
    end, "Prev Hunk")
    map("n", "]H", function()
      gs.nav_hunk("last")
    end, "Last Hunk")
    map("n", "[H", function()
      gs.nav_hunk("first")
    end, "First Hunk")
    map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
    map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
    map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
    map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
    map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
    map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
    map("n", "<leader>ghb", function()
      gs.blame_line({ full = true })
    end, "Blame Line")
    map("n", "<leader>ghB", function()
      gs.blame()
    end, "Blame Buffer")
    map("n", "<leader>ghd", gs.diffthis, "Diff This")
    map("n", "<leader>ghD", function()
      gs.diffthis("~")
    end, "Diff This ~")
  end,
})

require("ibl").setup({
  indent = {
    char = "│",
    tab_char = "│",
  },
  scope = {
    show_start = false,
    show_end = false,
  },
})

require("lualine").setup({})
require("todo-comments").setup({
  signs = false,
})
require("which-key").setup({ delay = 200, preset = "helix" })
require("mini.surround").setup()
