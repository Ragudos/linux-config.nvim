function ApplyTransparency()
  local hl_groups = {
    'Normal',
    'NormalFloat',
    'NormalNC',
    'SignColumn',
    'LineNr',
    'Folded',
    'NonText',
    'SpecialKey',
  }

  for _, group in ipairs(hl_groups) do
    vim.api.nvim_set_hl(0, group, { bg = 'none', ctermbg = 'none' })
  end
end

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = ApplyTransparency,
})

function ColorMyPencils(color) vim.cmd.colorscheme(color or 'rose-pine') end

return {
  {
    'folke/tokyonight.nvim',
    opts = {
      style = 'storm',
      transparent = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
    init = function()
      local ok, wk = pcall(require, 'which-key')
      if ok then wk.add {
        { '<leader>t', group = '[T]oggle' },
        { '<leader>tc', group = '[T]heme [C]hange' },
      } end
    end,
    keys = {
      {
        '<leader>tcr',
        function() ColorMyPencils 'rose-pine' end,
        desc = 'Rose Pine',
      },
      {
        '<leader>tcg',
        function() ColorMyPencils 'gruvbox' end,
        desc = 'Gruvbox',
      },
      {
        '<leader>tcn',
        function() ColorMyPencils 'tokyonight' end,
        desc = 'TokyoNight',
      },
    },
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      styles = {
        transparency = true,
      },
    },
  },

  {
    'ellisonleao/gruvbox.nvim',
    opts = {
      transparent_mode = true,
      italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
      },
    },
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      require('rose-pine').setup(opts)
      ColorMyPencils 'rose-pine'
    end,
  },
}
