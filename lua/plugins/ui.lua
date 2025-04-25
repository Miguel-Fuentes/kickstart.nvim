-- lua/plugins/ui.lua
return {
  -- WhichKey plugin (shows keymap hints)
  {
    'folke/which-key.nvim',
    -- Load very lazily, activates when needed
    event = 'VeryLazy',
    config = function()
      -- Call setup for which-key
      require('which-key').setup {
        -- Default setup is usually fine, add options here if needed
        -- Example: customize window appearance
        -- window = { border = "single" },
      }
      -- Optional: You can register descriptions for key prefixes
      -- require('which-key').register({ ["<leader>"] = { name = "+leader" } })
    end,
  },

  -- Add other UI plugins here later (like lualine, bufferline, etc.)
}
