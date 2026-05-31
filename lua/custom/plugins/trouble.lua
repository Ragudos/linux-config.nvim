return {
  {
    'folke/trouble.nvim',
    keys = {
      {
        '<leader>tt',
        function() require('trouble').toggle() end,
        desc = 'Toggle Trouble',
      },

      {
        '<leader>tx',
        function() require('trouble').close() end,
        desc = 'Close Trouble',
      },

      {
        '<leader>td',
        function() require('trouble').toggle 'diagnostics' end,
        desc = 'Diagnostics',
      },

      {
        '<leader>tb',
        function() require('trouble').toggle('diagnostics', { filter = { buf = 0 } }) end,
        desc = 'Buffer Diagnostics',
      },

      {
        '<leader>ts',
        function() require('trouble').toggle 'symbols' end,
        desc = 'Document Symbols',
      },

      {
        '<leader>tl',
        function() require('trouble').toggle 'lsp' end,
        desc = 'LSP References / Definitions',
      },

      {
        '<leader>tL',
        function() require('trouble').toggle 'loclist' end,
        desc = 'Location List',
      },

      {
        '<leader>tq',
        function() require('trouble').toggle 'qflist' end,
        desc = 'Quickfix List',
      },

      {
        ']t',
        '<cmd>Trouble next skip_groups=true jump=true<CR>',
        desc = 'Next Trouble Item',
      },
      {
        '[t',
        '<cmd>Trouble prev skip_groups=true jump=true<CR>',
        desc = 'Previous Trouble Item',
      },
    },

    init = function()
      local ok, wk = pcall(require, 'which-key')
      if ok then wk.add {
        { '<leader>t', group = '[T]rouble' },
      } end
    end,
  },
}
