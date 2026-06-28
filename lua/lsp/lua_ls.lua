return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.git', 'init.lua' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        -- `vim` グローバルに対する警告を非表示にする
        globals = { 'vim' },
      },
      workspace = {
        -- Neovim自体のLua API定義（型定義や補完用）を読み込ませる
        library = {
          vim.env.VIMRUNTIME .. '/lua',
        },
        checkThirdParty = false,
      },
    },
  },
}
