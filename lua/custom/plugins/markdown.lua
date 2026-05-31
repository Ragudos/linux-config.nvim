return {
  -- 1. Live Preview in the Browser
  {
    'iamcco/markdown-preview.nvim',
    cmd = {
      'MarkdownPreviewToggle',
      'MarkdownPreview',
      'MarkdownPreviewStop',
    },
    build = 'cd app && yarn install',
    ft = 'markdown',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function(event)
          vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', {
            buffer = event.buf,
            desc = 'Markdown Preview (Browser)',
          })
        end,
      })
    end,
    config = function() vim.g.mkdp_auto_close = 1 end,
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      heading = {
        sign = false,
        icons = { ' 󰲡 ', ' 󰲣 ', ' 󰲥 ', ' 󰲧 ', ' 󰲩 ', ' 󰲫 ' },
      },
      checkbox = {
        enabled = true,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function(event)
          vim.keymap.set('n', '<leader>mr', '<cmd>RenderMarkdown toggle<CR>', {
            buffer = event.buf,
            desc = 'Markdown Render Toggle (Editor)',
          })
        end,
      })
    end,
  },
}
