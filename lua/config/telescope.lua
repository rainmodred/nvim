require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "yarn.lock",
      "package-lock.json",
    },
    layout_config = {
      horizontal = {
        preview_cutoff = 0,
      },
    },
  },
})
