require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "yarn.lock",
      "package-lock.json",
    },
  },
})
