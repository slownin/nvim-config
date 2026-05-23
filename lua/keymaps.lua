local map = vim.api.nvim_set_keymap

-- ウィンドウ間移動
map('n', '<Leader>h', '<C-w>h', { noremap = true, silent = true })
map('n', '<Leader>j', '<C-w>j', { noremap = true, silent = true })
map('n', '<Leader>k', '<C-w>k', { noremap = true, silent = true })
map('n', '<Leader>l', '<C-w>l', { noremap = true, silent = true })

-- スプリット
map('n', '<Leader>s', '<Cmd>sp<CR>', { noremap = true, silent = true })
map('n', '<Leader>v', '<Cmd>vs<CR>', { noremap = true, silent = true })

-- 雑多
map('i', 'jj', '<ESC>', { noremap = true })

-- バッファ
map('n', '<S-h>', '<Cmd>bprevious<CR>', { noremap = true })
map('n', '<S-l>', '<Cmd>bnext<CR>', { noremap = true })
map('n', '<Leader>bd', '<Cmd>bdelete<CR>', { noremap = true })

-- NvimTree
map('n', '<Leader>b', '<Cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })

-- MarkdownPreview
map('n', '<Leader>mp', '<Cmd>MarkdownPreviewToggle<CR>', { noremap = true, silent = true })

-- Telescope
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { desc = 'Telescope help tags' })
