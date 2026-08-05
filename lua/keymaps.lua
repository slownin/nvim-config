-- ノーマルモードに戻る
vim.keymap.set("i", "jj", "<Esc>", { desc = "ノーマルモードに戻る" })

-- ウィンドウ間移動
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "左のウィンドウに移動" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "下のウィンドウに移動" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "上のウィンドウに移動" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "右のウィンドウに移動" })

-- ウィンドウ分割
vim.keymap.set("n", "<Leader>s", "<Cmd>sp<CR>", { desc = "ウィンドウを水平（上下）に分割" })
vim.keymap.set("n", "<Leader>v", "<Cmd>vs<CR>", { desc = "ウィンドウを垂直（左右）に分割" })

-- バッファ
vim.keymap.set("n", "<Tab>",      "<Cmd>bprevious<CR>", { desc = "次のバッファ" })
vim.keymap.set("n", "<S-Tab>",    "<Cmd>bnext<CR>",     { desc = "前のバッファ" })
vim.keymap.set("n", "<Leader>bd", "<Cmd>bdelete<CR>",   { desc = "バッファを削除" })

-- neo-tree
vim.keymap.set("n", "<Leader>b", "<Cmd>Neotree toggle=true<CR>", { desc = "neo-tree 表示/非表示" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<Leader>fg", builtin.live_grep,  { desc = "Telescope live grep" })
vim.keymap.set("n", "<Leader>fb", builtin.buffers,    { desc = "Telescope buffers" })
vim.keymap.set("n", "<Leader>fh", builtin.help_tags,  { desc = "Telescope help tags" })

-- lazygit
vim.keymap.set("n", "<Leader>gg", "<Cmd>LazyGit<CR>", { desc = "lazygit 起動" })

-- toggleterm
vim.keymap.set("n", "<C-t>", "<Cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })

-- Markdown Preview
vim.keymap.set('n', '<Leader>mp', '<Cmd>MarkdownPreviewToggle<CR>', { desc = "Markdown Preview Toggle" })

-- LSP（LSPがバッファに接続された時だけ有効 ）
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)      -- 定義ジャンプ
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)            -- ホバー表示
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)  -- 実装一覧
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)      -- 参照元一覧
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)   -- リネーム
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)  -- コードアクション
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts) -- エラー詳細
  end,
})
