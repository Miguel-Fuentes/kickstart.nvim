-- lua/plugins/completion.lua
return {
  -- Autocompletion Engine
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter', -- Load cmp engine when starting insert mode
    dependencies = {
      -- Source for LSP suggestions
      'hrsh7th/cmp-nvim-lsp',
      -- Source for buffer words
      'hrsh7th/cmp-buffer',
      -- Source for file system paths
      'hrsh7th/cmp-path',

      -- Snippet engine
      { 'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp' },
      -- Source for snippet suggestions
      'saadparwaiz1/cmp_luasnip',

      -- Optional: Adds nice icons to completion items
      -- 'onsails/lspkind.nvim',

      -- Optional: Large collection of snippets
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      -- Optional: If you install lspkind
      -- local lspkind = require('lspkind')

      -- Load snippets from friendly-snippets (optional)
      require('luasnip.loaders.from_vscode').lazy_load()
      -- Ensure LuaSnip settings respect lazy loading
      luasnip.config.setup {}

      cmp.setup {
        completion = {
          -- Use <Tab> to select suggestion and trigger completion
          -- Set completeopt to have menu display even when only one suggestion
          completeopt = 'menu,menuone,noinsert',
        },
        snippet = {
          -- REQUIRED - Tells nvim-cmp how to expand snippets provided by LuaSnip
          expand = function(args)
            luasnip.lsp_expand(args.body) -- Expand snippets using LuaSnip
          end,
        },
        -- Key mappings for completion menu
        mapping = cmp.mapping.preset.insert {
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- Previous suggestion
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- Next suggestion
          ['<Down>'] = cmp.mapping.select_next_item(cmp_select), -- Alternative next
          ['<Up>'] = cmp.mapping.select_prev_item(cmp_select), -- Alternative previous
          ['<C-d>'] = cmp.mapping.scroll_docs(-4), -- Scroll documentation down
          ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Scroll documentation up
          ['<C-Space>'] = cmp.mapping.complete(), -- Manually trigger completion
          ['<C-e>'] = cmp.mapping.abort(), -- Close completion menu
          -- Use <CR> to confirm selection.
          -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<CR>'] = cmp.mapping.confirm { select = true },
          -- You could use Tab for completion (if not using it for snippet jumps)
          -- ['<Tab>'] = cmp.mapping(function(fallback) ... end, { "i", "s" }),
        },
        -- Sources for completion suggestions (order defines priority)
        sources = cmp.config.sources {
          { name = 'nvim_lsp' }, -- Suggestions from LSP server
          { name = 'luasnip' }, -- Snippets from LuaSnip
          { name = 'buffer' }, -- Suggestions from words in current buffer
          { name = 'path' }, -- Suggestions for file paths
        },

        -- Optional: Add icons using lspkind
        -- formatting = {
        --   format = lspkind.cmp_format({
        --     mode = 'symbol_text', -- show only symbol and text
        --     maxwidth = 50,
        --     ellipsis_char = '...',
        --   })
        -- },
      } -- End cmp.setup

      -- Optional: Setup keymaps for LuaSnip jump points AFTER cmp setup
      -- Jump forward in snippet placeholders
      vim.keymap.set({ 'i', 's' }, '<C-l>', function()
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        end
      end, { silent = true })
      -- Jump backward in snippet placeholders
      vim.keymap.set({ 'i', 's' }, '<C-h>', function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { silent = true })
    end, -- End config function
  }, -- End nvim-cmp specification
} -- End returned table
