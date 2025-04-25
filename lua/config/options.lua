-- Set Neovim options using vim.opt

local opt = vim.opt -- Local variable for conciseness

-- Line Numbers
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers

-- Tabs and Indentation
opt.tabstop = 4 -- Number of spaces tabs count for
opt.softtabstop = 4 -- Number of spaces when inserting <Tab>
opt.shiftwidth = 4 -- Number of spaces for auto-indent
opt.expandtab = true -- Use spaces instead of tabs
opt.autoindent = true -- Indent new lines automatically
opt.smartindent = true -- Be smart about indentation

-- File formats
opt.fileformats = 'unix,dos,mac'

-- Search Settings
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Unless search pattern contains uppercase letters
opt.incsearch = true -- Show matches incrementally while typing
opt.hlsearch = true -- Highlight search results

-- Appearance
opt.termguicolors = true -- Enable 24-bit RGB colors (essential for modern themes)
opt.scrolloff = 8 -- Keep 8 lines visible above/below cursor when scrolling
opt.sidescrolloff = 8 -- Keep 8 columns visible left/right of cursor when scrolling horizontally
opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift text

-- Behavior
opt.wrap = false -- Do not wrap lines
opt.clipboard = 'unnamedplus' -- Use system clipboard by default (requires `xclip` or similar)

-- Performance/Annoyances
opt.backup = false -- Do not create backup files
opt.writebackup = false -- Do not create backup files during write
opt.swapfile = false -- Do not create swap files
opt.undofile = true -- Enable persistent undo
opt.updatetime = 250 -- Faster update time for CursorHold events (e.g., LSP diagnostics)
opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds)
