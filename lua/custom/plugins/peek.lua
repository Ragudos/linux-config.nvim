return {
  {
    'toppair/peek.nvim',
    event = { 'VimEnter' },
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup {
        filetype = { 'markdown', 'conf' },
      }

      vim.keymap.set('n', '<leader>po', require('peek').open, { desc = 'Open Peek Markdown Preview' })
      vim.keymap.set('n', '<leader>pc', require('peek').close, { desc = 'Close Peek Markdown Preview' })

      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },
}
