-- lua/plugins/formatting.lua
return {
  {
    'stevearc/conform.nvim',
    -- Lazy-load triggers (existing):
    event = { 'BufWritePre' }, -- Load before saving
    cmd = { 'ConformInfo' }, -- Load on command

    -- Plugin options (existing):
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        html = { 'prettierd' },
        css = { 'prettierd' },
        json = { 'prettierd' },
        yaml = { 'prettierd' },
        markdown = { 'prettierd' },
        sh = { 'shfmt' },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },

    -- Define keymaps associated with this plugin: ADD THIS 'keys' TABLE
    keys = {
      {
        '<leader>f', -- The key sequence
        function()
          -- The function to run AFTER lazy.nvim loads conform.nvim
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = { 'n', 'v' }, -- Modes where the keymap is active
        desc = 'Format buffer or visual selection', -- Description for help/which-key
      },
      -- You could add other conform-specific keymaps here if needed
    },
  }, -- End of conform.nvim specification
} -- End of returned table
