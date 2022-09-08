local theme_status_ok, theme = pcall(require, "tokyonight")
if not theme_status_ok then
  return
end

theme.setup({
  style = "night",
  on_highlights = function(hl, c)
    hl.NvimTreeFolderIcon = {
      bg = c.none,
      fg = c.none,
    }
  end,
})

vim.cmd([[colorscheme tokyonight]])
