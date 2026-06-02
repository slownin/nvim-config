require("base")
require("keymaps")
require("config.lazy")

vim.diagnostic.config({
  -- エラー箇所に下線を引く(default: true)
  underline = true,
  -- 行末にエラーメッセージを表示(default: false)
  virtual_text = true,
  -- 行番号の横にアイコンを表示(default: true)
  signs = true,
  -- 入力中は表示を更新しない(default: true)
  update_in_insert = false,
  -- 重大なエラーを優先表示(default: false)
  severity_sort = true,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = {
          "vim",
        },
      },
    },
  },
})
