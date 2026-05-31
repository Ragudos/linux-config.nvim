return {
  'tpope/vim-fugitive',
  cmd = {
    'G',
    'Git',
    'Gedit',
    'Gsplit',
    'Gvsplit',
    'Gtabedit',
    'Gpedit',
    'Gwrite',
    'Gread',
    'Gwq',
    'Gdiffsplit',
    'Gvdiffsplit',
    'Gblame',
    'Ggrep',
    'Glgrep',
    'Gclog',
    'Gllog',
    'GMove',
    'GRename',
    'GDelete',
    'GRemove',
  },
  init = function()
    local ok, wk = pcall(require, 'which-key')
    if ok then wk.add {
      { '<leader>g', group = '[G]it / Fugitive' },
    } end
  end,
  keys = {
    -- Core Wrapper / Status
    { '<leader>gs', '<cmd>Git<cr>', desc = 'Git Status (Summary)' },
    { '<leader>gc', '<cmd>Git commit<cr>', desc = 'Git Commit' },

    -- =====================================================================
    -- TELESCOPE GIT INTEGRATIONS
    -- =====================================================================
    -- Fuzzy search project branches (Press <CR> to checkout, <C-d> to delete)
    { '<leader>gb', "<cmd>lua require('telescope.builtin').git_branches()<cr>", desc = 'Telescope: Git Branches' },

    -- Fuzzy search all commit history logs
    { '<leader>gl', "<cmd>lua require('telescope.builtin').git_commits()<cr>", desc = 'Telescope: Git Log (All Commits)' },

    -- Fuzzy search history for the CURRENT BUFFER file only
    { '<leader>gL', "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", desc = 'Telescope: Git Log (Current Buffer)' },

    -- CUSTOM: Git Log with Reverse ordering (Chronological order)
    {
      '<leader>gr',
      function()
        require('telescope.builtin').git_commits {
          git_command = { 'git', 'log', '--reverse', '--pretty=oneline', '--abbrev-commit', '--', '.' },
        }
      end,
      desc = 'Telescope: Git Log (Reverse Order)',
    },

    -- Fuzzy search Git Stashes
    { '<leader>gy', "<cmd>lua require('telescope.builtin').git_stash()<cr>", desc = 'Telescope: Git Stash List' },
    -- =====================================================================

    -- Diffing & Blaming (Shifted keys slightly to make room for Telescope)
    { '<leader>gd', '<cmd>Gdiffsplit<cr>', desc = 'Git Diff (Horizontal Split)' },
    { '<leader>gD', '<cmd>Gvdiffsplit<cr>', desc = 'Git Diff (Vertical Split)' },
    { '<leader>gB', '<cmd>Git blame<cr>', desc = 'Git Blame Panel' },

    -- Buffer / Index Manipulation
    { '<leader>gw', '<cmd>Gwrite<cr>', desc = 'Git Write (Stage file)' },
    { '<leader>gq', '<cmd>Gwq<cr>', desc = 'Git Write and Quit buffer' },

    -- Navigation / Object Splits
    { '<leader>ge', '<cmd>Gedit<cr>', desc = 'Git Edit (Open current file object)' },
    { '<leader>gh', '<cmd>Gsplit<cr>', desc = 'Git Object Split (Horizontal)' },
    { '<leader>gv', '<cmd>Gvsplit<cr>', desc = 'Git Object Split (Vertical)' },

    -- History & Searching via Fugitive Quickfix (If you still want non-telescope versions)
    { '<leader>gg', ':Ggrep ', desc = 'Git Grep (Into Quickfix)' },
    { '<leader>gh', '<cmd>Gclog<cr>', desc = 'Git History Log (Into Quickfix)' },

    -- File System Adjustments
    { '<leader>gm', ':GMove ', desc = 'Git Move / Rename' },
    { '<leader>gn', ':GRename ', desc = 'Git Rename (Relative)' },
    { '<leader>gx', '<cmd>GDelete<cr>', desc = 'Git Delete (rm & wipe buffer)' },
  },
  config = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'FugitiveIndex',
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set('n', '<leader>gp', function() vim.cmd.Git 'push' end, vim.tbl_extend('force', opts, { desc = 'Fugitive: Push from Status' }))

        vim.keymap.set(
          'n',
          '<leader>gP',
          function() vim.cmd.Git { 'pull', '--rebase' } end,
          vim.tbl_extend('force', opts, { desc = 'Fugitive: Pull Rebase from Status' })
        )
      end,
    })
  end,
}
