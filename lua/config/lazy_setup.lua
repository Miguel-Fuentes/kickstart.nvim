-- [[ Install `lazy.nvim` plugin manager ]]
--    See https://github.com/folke/lazy.nvim
--
--    NOTE: `lazy.nvim` automatically finds configuration files based on the patterns
--          we provide below. We don't need to manually `require` theme files or plugins.

-- Get the path for lazy.nvim data
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

-- Bootstrap lazy.nvim if it's not already installed
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none', -- Don't download history
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- Use the latest stable version
    lazypath,
  }
  print 'lazy.nvim installed. Restart Neovim.'
end

-- Add lazy.nvim to the runtime path
vim.opt.rtp:prepend(lazypath)

-- [[ Configure `lazy.nvim` ]]
require('lazy').setup {
  -- This is the crucial part: specify where lazy should look for plugin specs.
  -- We'll tell it to look in a directory named 'plugins' within our 'lua' folder.
  spec = {
    { import = 'plugins' },
  },

  -- Configure lazy.nvim options
  install = {
    colorscheme = { 'tokyonight', 'habamax' }, -- Try installing these colorschemes first if available
  },
  checker = {
    enabled = true, -- Automatically check for plugin updates
    notify = false, -- Don't notify on startup, use :Lazy update instead
  },
  change_detection = {
    enabled = true,
    notify = false, -- Automatically check for config file changes and reload Neovim
  },
  performance = {
    rtp = {
      -- Use native Neovim runtime path manipulation which is faster
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}

-- Optional: Load plugins on startup if needed, otherwise lazy-load them
-- vim.cmd [[ LspStart ]] -- Example if you had LSP setup
