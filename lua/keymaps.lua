local map = vim.api.nvim_set_keymap

-- ウィンドウ間移動
map('n', '<Leader>h', '<C-w>h', { noremap = true, silent = true })
map('n', '<Leader>j', '<C-w>j', { noremap = true, silent = true })
map('n', '<Leader>k', '<C-w>k', { noremap = true, silent = true })
map('n', '<Leader>l', '<C-w>l', { noremap = true, silent = true })

-- スプリット
map('n', '<Leader>s', '<Cmd>sp<CR>', { noremap = true, silent = true })
map('n', '<Leader>v', '<Cmd>vs<CR>', { noremap = true, silent = true })

map('i', 'jj', '<ESC>', { noremap = true })

map('n', '<Leader>b', '<Cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })

map('n', '<Leader>mp', '<Cmd>MarkdownPreviewToggle<CR>', { noremap = true, silent = true })

map('n', '<S-h>', '<Cmd>bprevious<CR>', { noremap = true })
map('n', '<S-l>', '<Cmd>bnext<CR>', { noremap = true })
map('n', '<Leader>bd', '<Cmd>bdelete<CR>', { noremap = true })
