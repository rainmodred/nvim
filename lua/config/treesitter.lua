local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = { "javascript", "typescript", "tsx", "css", "html", "json", "jsdoc", "markdown", "scss" },
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  autopairs = {
    enable = true,
  },
})
