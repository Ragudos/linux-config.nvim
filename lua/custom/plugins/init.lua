-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-lua/plenary.nvim',
    name = 'plenary',
  },
  require 'custom.plugins.colors',
  require 'custom.plugins.undotree',
  require 'custom.plugins.zenmode',
  require 'custom.plugins.harpoon',
}
