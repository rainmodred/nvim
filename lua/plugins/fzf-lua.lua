return {
  "ibhagwan/fzf-lua",
  keys = {
    -- disable the keymap to grep files
    { "<C-p>", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
  },
  opts = {
    previewers = {
      builtin = {
        syntax_limit_b = 1024 * 100, -- 100KB
      },
    },
  },
}
