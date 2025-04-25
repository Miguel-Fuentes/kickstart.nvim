-- lua/plugins/lsp.lua
-- Contains configuration for LSP (Language Server Protocol) support

return {
  -- Main LSP configuration plugin
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Mason manages LSP server, linter, formatter installations
      'williamboman/mason.nvim',
      -- Mason-lspconfig bridges Mason and nvim-lspconfig
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      -- Import necessary modules
      local lspconfig = require 'lspconfig'
      local mason_lspconfig = require 'mason-lspconfig'
      local cmp_nvim_lsp = require 'cmp_nvim_lsp'

      -- [[ Define on_attach function ]]
      -- This function runs whenever an LSP server successfully attaches to a buffer
      local on_attach = function(client, bufnr)
        -- client: The LSP client object
        -- bufnr: The buffer number the client is attaching to

        local map = vim.keymap.set
        -- Keymaps specific to the buffer attached by the LSP server
        local bufopts = { noremap = true, silent = true, buffer = bufnr, desc = 'LSP' }

        -- Standard LSP keymaps (See :help vim.lsp.buf)
        map('n', 'K', vim.lsp.buf.hover, bufopts) -- Show hover documentation
        map('n', 'gd', vim.lsp.buf.definition, bufopts) -- Go to definition
        map('n', 'gD', vim.lsp.buf.declaration, bufopts) -- Go to declaration
        map('n', 'gi', vim.lsp.buf.implementation, bufopts) -- Go to implementation
        map('n', 'gr', vim.lsp.buf.references, bufopts) -- List references
        map('n', '<leader>rn', vim.lsp.buf.rename, bufopts) -- Rename symbol under cursor
        map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- Show code actions available

        -- Diagnostic keymaps (See :help vim.diagnostic)
        map('n', '[d', vim.diagnostic.goto_prev, bufopts) -- Go to previous diagnostic item
        map('n', ']d', vim.diagnostic.goto_next, bufopts) -- Go to next diagnostic item
        map('n', '<leader>dl', vim.diagnostic.open_float, bufopts) -- Show diagnostic details in floating window

        -- You can add more LSP keymaps here based on capabilities or preferences
        -- Example: vim.lsp.buf.format({ async = true })
      end

      -- Define lsp capabilities for autocompletion
      local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

      -- [[ Setup Mason-LSPConfig bridge ]]
      -- Configure which LSP servers Mason should install AND setup via lspconfig
      mason_lspconfig.setup {
        -- List of LSP servers to install automatically by Mason
        -- These servers are then configured by lspconfig via the handlers below
        ensure_installed = {
          'lua_ls', -- Lua language server
          'jsonls', -- JSON language server
          'html', -- HTML language server
          'cssls', -- CSS language server
          'bashls', -- Bash language server
          'pyright', -- Add other LSP servers you use here (e.g., "pyright", "rust_analyzer")
        },
        -- Whether Mason should automatically install missing servers on startup
        automatic_installation = true,

        -- Handlers define how lspconfig actually sets up each server.
        -- The on_attach function we defined above is passed here.
        handlers = {
          -- Default handler for servers without custom setup below
          function(server_name)
            lspconfig[server_name].setup {
              on_attach = on_attach,
              capabilities = capabilities, -- Add this later for autocompletion (nvim-cmp)
            }
          end,

          -- Example of custom setup for lua_ls, if needed
          ['lua_ls'] = function()
            lspconfig.lua_ls.setup {
              -- Custom settings for lua_ls. Example: Tell it about Neovim globals
              settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
              on_attach = on_attach,
              capabilities = capabilities, -- Add later for autocompletion (nvim-cmp)
            }
          end,
          -- Add custom handlers for other servers here if you need specific setup options
        }, -- End of handlers table
      } -- End of mason_lspconfig.setup call

      -- [[ Diagnostic configuration ]]
      -- Configure how diagnostics (errors, warnings) are displayed
      vim.diagnostic.config {
        virtual_text = false, -- Don't show error message inline (can be noisy)
        signs = true, -- Show icons in the sign column (gutter)
        underline = true, -- Underline errors
        update_in_insert = false, -- Only update diagnostics when leaving insert mode
        severity_sort = true, -- Sort diagnostics by severity
      }

      -- [[ Diagnostic signs customization ]] (Optional: Pretty icons)
      -- Make sure you have a Nerd Font installed and configured in your terminal
      local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end, -- End of the main config function for nvim-lspconfig
  }, -- End of nvim-lspconfig plugin specification

  -- Mason plugin configuration (installs LSPs, Linters, Formatters)
  {
    'williamboman/mason.nvim',
    opts = {
      -- List of Linters and Formatters Mason should install automatically
      -- Make sure these names match the package names shown in :Mason
      ensure_installed = {
        -- Linters
        'shellcheck', -- Shell scripts
        'luacheck', -- Lua

        -- Formatters
        'prettierd', -- Web formats (daemon for speed)
        'stylua', -- Lua
        'shfmt', -- Shell scripts
      },
      -- Optional: Add UI customizations for Mason window
      -- ui = { border = "rounded" },
    },
  },

  -- Mason-lspconfig glue plugin (no specific config needed here)
  {
    'williamboman/mason-lspconfig.nvim',
    -- No opts or config needed here as it's configured via nvim-lspconfig's dependencies/config
  },
} -- End of the main returned table for lazy.nvim
