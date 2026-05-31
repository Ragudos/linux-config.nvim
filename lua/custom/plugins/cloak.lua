return {
  'laytan/cloak.nvim',
  opts = {
    enabled = true,
    cloak_character = '*',
    highlight_group = 'Comment',
    patterns = {
      {
        file_pattern = {
          '.env*',
          '*.env',
          'wrangler.toml',
          '.dev.vars',
        },
        cloak_pattern = '=.+',
      },
    },
  },
  keys = {
    {
      '<leader>ct',
      '<cmd>CloakToggle<CR>',
      desc = 'Toggle Cloak (hide/show secrets)',
    },
    {
      '<leader>ce',
      '<cmd>CloakEnable<CR>',
      desc = 'Enable Cloak overlay',
    },
    {
      '<leader>cd',
      '<cmd>CloakDisable<CR>',
      desc = 'Disable Cloak overlay',
    },
  },
  init = function()
    local ok, wk = pcall(require, 'which-key')
    if ok then wk.add {
      { '<leader>c', group = '[C]loak secrets' },
    } end
  end,
}
