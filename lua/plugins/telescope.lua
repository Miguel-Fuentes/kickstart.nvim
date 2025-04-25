-- lua/plugins/telescope.lua
return {
  -- Core Telescope fuzzy finder plugin
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter', -- Load Telescope shortly after Neovim starts
    tag = '0.1.6', -- Specify a stable tag (check GitHub for latest)
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim', -- For using Telescope for vim.ui.select
      'nvim-tree/nvim-web-devicons', -- For nice icons (ensure Nerd Font is installed)
      -- Note: telescope-fzf-native is listed separately below
    },
    config = function()
      local telescope = require 'telescope'

      -- Configure Telescope - Add settings as needed
      telescope.setup {
        defaults = {
          -- Add general default configurations here (optional)
          -- prompt_prefix = " ",
          -- selection_caret = " ",
          -- file_ignore_patterns = {"node_modules", ".git"},
          -- winblend = 10, -- Make floating window slightly transparent
        },
        pickers = {
          -- Add picker-specific configurations here (optional)
          -- find_files = { theme = "dropdown" },
        },
        extensions = {
          -- Configure the ui-select extension to use Telescope's dropdown theme
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          -- Configure other extensions like fzf here if needed
          -- fzf = { fuzzy = true, override_generic_sorter = true, ... }
        },
      } -- End of telescope.setup

      -- Load extensions using pcall for safety (doesn't error if extension not found)
      -- Load fzf sorter if telescope-fzf-native is installed/built
      pcall(telescope.load_extension, 'fzf')
      -- Load the ui-select extension to hook into vim.ui.select
      pcall(telescope.load_extension, 'ui-select')

      -- Keymaps are defined in lua/config/keymaps.lua as requested
    end, -- End of config function
  }, -- End of telescope.nvim specification

  -- === Dependencies ===

  -- Plenary: Required by Telescope and other plugins
  { 'nvim-lua/plenary.nvim', lazy = true }, -- Can be lazy-loaded

  -- Telescope UI Select: Integrates Telescope for vim.ui.select prompts
  { 'nvim-telescope/telescope-ui-select.nvim', lazy = true }, -- Can be lazy-loaded

  -- Devicons: Provides icons for filetypes, used by Telescope and others
  { 'nvim-tree/nvim-web-devicons', lazy = true }, -- Load when needed

  -- Optional but recommended: Faster sorting using C implementation
  -- Requires build tools (make, gcc/clang) installed on your system
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- Specifies dependency on build tool 'make'
    build = 'make',
    -- Conditionally loads only if 'make' is executable
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
    -- Can lazy load this as Telescope will load it via pcall when needed
    lazy = true,
  },
} -- End of returned table
