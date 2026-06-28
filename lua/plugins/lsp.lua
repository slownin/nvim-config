return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    -- mason-lspconfigのセットアップ前に、lspconfigを確実にロードさせておく
    require("lspconfig")

    -- 外部設定を事前読み込み
    local lua_ls_custom = require("lsp.lua_ls")
    vim.lsp.config("lua_ls", lua_ls_custom)

    require("mason").setup()

    -- mason-lspconfigの設定（自動インストールと一括有効化）
    require("mason-lspconfig").setup({
      -- 自動インストールしたいLSP
      ensure_installed = {
        "lua_ls",  -- Lua
      },

      -- Mason で管理されているLSPを自動で有効化（デフォルトでtrue）
      automatic_enable = true,
    })

    -- 診断の見た目設定
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
    })
  end,
}
