return {
  {
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
    config = function()
      require('neo-tree').setup({})
    end,
  },

  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {},
  },

  --autopairs
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'echasnovski/mini.bufremove',
    keys = {
      {
        '<leader>d',
        function()
          require('mini.bufremove').delete(0, false)
        end,
        desc = 'Delete Buffer',
      },
      {
        '<leader>bD',
        function()
          require('mini.bufremove').delete(0, true)
        end,
        desc = 'Delete Buffer (Force)',
      },
    },
  },
  -- { 'echasnovski/mini.animate',                    event = 'VeryLazy', version = false },

  -- comments
  { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true },
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    opts = {
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },
}
