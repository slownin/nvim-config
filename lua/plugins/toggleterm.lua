return {
  "akinsho/toggleterm.nvim",
  version = "*",
  -- キー入力、またはコマンド実行時に遅延ロード（Lazy Load）
  keys = {
    { "<C-t>", desc = "Toggle Terminal" },
    { "<leader>g", desc = "Toggle LazyGit" },
  },
  cmd = { "ToggleTerm" },
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      -- Ctrl + t で開閉する設定（ノーマルモード用）
      open_mapping = [[<C-t>]],

      -- 画面下（horizontal）に開く
      direction = "horizontal",

      -- ターミナルサイズ（高さ）の指定（画面の30%）
      size = function(term)
        if term.direction == "horizontal" then
          return vim.o.lines * 0.3
        end
      end,

      -- インサートモードやターミナルモードでも同じキー（Ctrl + t）で閉じられるようにする
      insert_mappings = true,
      terminal_mappings = true,
    })

    -- ====================================================================
    -- 1. ターミナル内から他ウィンドウへの移動（Ctrl + h, j, k, l）
    -- ====================================================================
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      -- Esc 2回でノーマルモードに戻る
      vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], opts)

      -- ターミナルから直接、上下左右のウィンドウへ移動
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end

    -- ターミナルが開いたときだけ上記のキーマップを有効化
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end,
}
