return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',

  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  opts = {
    filesystem = {
      follow_current_file = true,
    },
  },
  config = function(_, opts)
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    require('neo-tree').setup(opts)
  end,
}
