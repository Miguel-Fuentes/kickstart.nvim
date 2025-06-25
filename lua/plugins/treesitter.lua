-- lua/plugins/treesitter.lua
return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- Run build command `:TSUpdate` after plugin install/update
    build = ':TSUpdate',
    config = function()
      local treesitter_config = require 'nvim-treesitter.configs'

      treesitter_config.setup {
        -- A list of parser names, or "all" (may be slow)
        -- Must be languages supported by nvim-treesitter
        -- See https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
        ensure_installed = {
          -- Base languages crucial for Neovim config and docs
          'c',
          'lua',
          'vim',
          'vimdoc',
          'query',
          -- Common web development languages
          'json',
          'yaml',
          'html',
          'css',
          -- Common markup/data formats
          'markdown',
          'markdown_inline', -- inline is needed for fenced code blocks etc.
          'latex',
          -- Shell scripting
          'bash',
          -- Python
          'python',
          -- Add languages you commonly use here:
          -- "go", "rust", "java", "php", "cpp", etc.
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        -- Set to true if you have issues with async installs
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommended: set to `true` for convenience
        auto_install = true,

        -- === Core Modules ===
        highlight = {
          enable = true, -- Enable syntax highlighting based on Treesitter
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some breakage.
          -- Setting this to `true` will enable both grammars simultaneously based on language priorities.
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true, -- Enable indentation based on Treesitter (may override default indent)
        },

        -- === Optional Modules ===
        -- Add other modules here later if needed, e.g.:
        -- incremental_selection = { enable = true, ... },
        -- textobjects = { enable = true, ... },
      } -- End of setup call
    end, -- End of config function
  }, -- End of nvim-treesitter specification
} -- End of returned table
