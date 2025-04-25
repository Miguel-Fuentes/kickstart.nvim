-- This file defines colorscheme plugins

return { -- This file returns a table containing plugin specifications

  -- First plugin specification: tokyonight
  {
    'folke/tokyonight.nvim',
    lazy = false, -- Load immediately at startup
    priority = 1000, -- Ensure it loads early
    opts = {}, -- Pass default options to the theme
    config = function(_, opts)
      -- This function runs AFTER the plugin is loaded
      -- Apply the colorscheme here
      vim.cmd.colorscheme 'tokyonight'

      -- You could also add other configuration commands specific to tokyonight here
      -- example: vim.cmd[[hi NvimTreeNormal guibg=NONE]]
    end,
  },
} -- End of the table of plugin specifications
