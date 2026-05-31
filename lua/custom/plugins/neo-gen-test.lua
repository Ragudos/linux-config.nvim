return {
  {
    'danymat/neogen',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'L3MON4D3/LuaSnip',
    },
    keys = {
      {
        '<leader>ngf',
        function() require('neogen').generate { type = 'func' } end,
        desc = 'Function Doc',
      },
      {
        '<leader>ngt',
        function() require('neogen').generate { type = 'type' } end,
        desc = 'Type/Class Doc',
      },
    },
    config = function()
      local neogen = require 'neogen'

      neogen.setup {
        snippet_engine = 'luasnip',
        languages = {
          -- Go (Uses standard GoDoc strings)
          go = {
            template = { annotation_convention = 'godoc' },
          },
          -- Rust (Generates standard triple-slash `///` RustDoc)
          rust = {
            template = { annotation_convention = 'rustdoc' },
          },
          -- JavaScript / React JSX
          javascript = {
            template = { annotation_convention = 'jsdoc' },
          },
          javascriptreact = {
            template = { annotation_convention = 'jsdoc' },
          },
          -- TypeScript / React TSX
          typescript = {
            template = { annotation_convention = 'tsdoc' },
          },
          typescriptreact = {
            template = { annotation_convention = 'tsdoc' },
          },
        },
      }
    end,
  },

  -- 2. Neotest (Testing Framework)
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'marilari88/neotest-vitest',
      'nvim-neotest/neotest-plenary',
    },
    opts = function()
      return {
        adapters = {
          require 'neotest-vitest',
          require('neotest-plenary').setup {
            min_init = './scripts/tests/minimal.vim',
          },
        },
      }
    end,
    keys = {
      {
        '<leader>ntc',
        function() require('neotest').run.run() end,
        desc = 'Closest Case',
      },
      {
        '<leader>ntf',
        function() require('neotest').run.run(vim.fn.expand '%') end,
        desc = 'Current File',
      },
    },
    -- Safely register groups with which-key when this module loads
    init = function()
      local ok, wk = pcall(require, 'which-key')
      if ok then wk.add {
        { '<leader>n', group = '[N]eo Test/Generate' },
        { '<leader>ng', group = '[G]enerate Docs (Neogen)' },
        { '<leader>nt', group = '[T]est (Neotest)' },
      } end
    end,
  },
}
