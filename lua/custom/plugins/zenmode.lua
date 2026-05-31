return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      width = 90,
      options = {},
    },
    on_open = function(win)
      vim.wo[win].wrap = false
      -- If your ColorMyPencils function changes background/themes, call it here
      if type(ColorMyPencils) == 'function' then ColorMyPencils() end
    end,
  },

  keys = {
    {
      '<leader>zz',
      function()
        local zen = require 'zen-mode'
        zen.toggle {
          window = { width = 90 },
          on_open = function(win)
            vim.wo[win].number = true
            vim.wo[win].relativenumber = true
          end,
        }
      end,
      desc = 'Toggle Zen Mode (with line numbers)',
    },
    {
      '<leader>zZ',
      function()
        local zen = require 'zen-mode'
        zen.toggle {
          window = { width = 80 },
          on_open = function(win)
            vim.wo[win].number = false
            vim.wo[win].relativenumber = false
            vim.opt.colorcolumn = '0'
          end,
        }
      end,
      desc = 'Toggle Strict Zen Mode (no numbers/columns)',
    },
  },
  init = function()
    local ok, wk = pcall(require, 'which-key')
    if ok then wk.add {
      { '<leader>z', group = '[Z]en Mode' },
    } end
  end,
}
