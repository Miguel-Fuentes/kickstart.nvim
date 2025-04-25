-- lua/config/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- [[ General Keymaps ]]
-- Add any other global keymaps here...

-- [[ Plugin Keymaps ]]

-- Formatting (Conform)
-- Add other plugin-related keymaps later (e.g., for Telescope, Treesitter...)

map('n', '<leader>sh', function()
  require('telescope.builtin').help_tags()
end, { desc = '[S]earch [H]elp', noremap = true, silent = true })
map('n', '<leader>sk', function()
  require('telescope.builtin').keymaps()
end, { desc = '[S]earch [K]eymaps', noremap = true, silent = true })
map('n', '<leader>sf', function()
  require('telescope.builtin').find_files()
end, { desc = '[S]earch [F]iles', noremap = true, silent = true })
map('n', '<leader>ss', function()
  require('telescope.builtin').builtin()
end, { desc = '[S]earch [S]elect Telescope', noremap = true, silent = true })
map('n', '<leader>sw', function()
  require('telescope.builtin').grep_string()
end, { desc = '[S]earch current [W]ord', noremap = true, silent = true })
map('n', '<leader>sg', function()
  require('telescope.builtin').live_grep()
end, { desc = '[S]earch by [G]rep', noremap = true, silent = true })
map('n', '<leader>sd', function()
  require('telescope.builtin').diagnostics()
end, { desc = '[S]earch [D]iagnostics', noremap = true, silent = true })
map('n', '<leader>sr', function()
  require('telescope.builtin').resume()
end, { desc = '[S]earch [R]esume', noremap = true, silent = true })
map('n', '<leader>s.', function()
  require('telescope.builtin').oldfiles()
end, { desc = '[S]earch Recent Files ("." for repeat)', noremap = true, silent = true })
map('n', '<leader><leader>', function()
  require('telescope.builtin').buffers()
end, { desc = '[ ] Find existing buffers', noremap = true, silent = true })

map('n', '<leader>/', function()
  -- Require the necessary modules inside the function
  local builtin = require 'telescope.builtin'
  local themes = require 'telescope.themes'
  builtin.current_buffer_fuzzy_find(themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer', noremap = true, silent = true })

map('n', '<leader>s/', function()
  local builtin = require 'telescope.builtin'
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files', noremap = true, silent = true })

map('n', '<leader>sn', function()
  require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files', noremap = true, silent = true })
