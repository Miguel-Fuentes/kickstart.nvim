-- lua/plugins/editing.lua

return {
  -- Commenting (gc, gcc, gb, etc)
  {
    'numToStr/Comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },

  -- Auto Pairs (automatic closing of brackets, quotes, etc.)
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  -- Surround (ysiw", cs"', ds", etc.)
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    opts = {},
  },

  -- Sleuth (Auto-detect indentation settings) -- <<< ADD THIS BLOCK
  {
    'tpope/vim-sleuth',
    -- Load early to detect settings when a file is opened
    event = { 'BufReadPre', 'BufNewFile' },
    -- No configuration needed, it just works!
  },
} -- End of returned table
