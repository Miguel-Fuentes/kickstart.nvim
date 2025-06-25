-- lua/plugins/latex.lua
return {
  {
    'lervag/vimtex',
    -- Load VimTeX only for LaTeX files to speed up startup
    ft = { 'tex', 'plaintex', 'bib' },
    -- VimTeX uses global variables for configuration.
    -- We use lazy.nvim's `init` function to set these *before* the plugin loads.
    init = function()
      -- General Settings (See :help vimtex-options)
      vim.g.vimtex_view_method = 'zathura' -- Or 'sioyek', 'skim', 'general'
      vim.g.vimtex_compiler_method = 'latexmk' -- Recommended compiler engine
      vim.g.vimtex_compiler_latexmk = { -- Options for latexmk
        ['continuous'] = 0, -- Don't auto-compile continuously by default
        ['pdf_mode'] = 1, -- Compile to PDF (usually pdflatex)
        -- ["lualatex"] = 1, -- Uncomment to use lualatex instead of pdflatex
        -- ["xelatex"] = 1,  -- Uncomment to use xelatex
      }

      -- === Viewer Configuration ===
      -- If using 'general' viewer or needing specific options:
      -- vim.g.vimtex_view_general_viewer = 'sioyek' -- Example for Sioyek
      -- Example options for SyncTeX forward search (check VimTeX docs for your viewer)
      -- Zathura (usually works out of the box if vimtex_view_method = 'zathura')
      -- Sioyek Example:
      -- vim.g.vimtex_view_general_options = '--forward-search-file @tex --forward-search-line @line --reuse-instance --inverse-search "nvim --headless --listen /tmp/nvimsocket --remote-send \'<C-\\><C-N>:lua vim.cmd(\\"VimtexInverseSearch(\\\\\\"%l\\\\\\", \\\\\\"%f\\\\\\")\\")<CR>\'" @pdf'

      -- === Other Useful Settings ===
      -- Disable VimTeX's own formatting if using conform.nvim (recommended)
      vim.g.vimtex_format_enabled = 0
      -- Disable auto-opening quickfix window on compile errors (preference)
      vim.g.vimtex_quickfix_mode = 0
      -- Enable Conceal feature for prettier symbols (optional)
      vim.g.vimtex_syntax_conceal_enable = 1

      -- Tell VimTeX that lspconfig is handling LSP (important for some features)
      vim.g.vimtex_compiler_progname = 'nvr' -- Optional: helps with some viewer integrations
      -- VimTeX can optionally provide completion, but nvim-cmp + texlab is usually preferred
      vim.g.vimtex_completion_enabled = 0
      vim.g.vimtex_completion_provider = 'lsp' -- Inform VimTeX LSP might provide completion
    end, -- End of init function
  }, -- End of vimtex specification
} -- End of returned table
