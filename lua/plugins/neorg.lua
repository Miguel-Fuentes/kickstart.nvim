-- lua/plugins/neorg.lua
return {
  "nvim-neorg/neorg",
  lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {},
        ['core.completion'] = {
          config = {
            engine = 'nvim-cmp',
          }
        },
        ['core.keybinds'] = {
          config = {
            default_keybinds = true, -- Keep this for now, Neorg will just warn about conflicts.
          }
        },
        -- Add any other Neorg core modules you explicitly need and which don't cause 'not found' errors.
        -- Based on your successful load, it seems only core.defaults, core.concealer, core.completion, and core.keybinds are needed here.
      },
      -- REMOVED: The 'keybinds' table is no longer here.
    }
  end,
}
