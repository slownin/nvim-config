-- 文字コード、改行コード
vim.o.encoding = 'utf-8'
vim.scriptencoding = "utf-8"
vim.o.fileencodings = "utf-8,cp932,euc-jp,iso-2022-jp"
vim.o.fileformats = "unix,dos,mac"

-- 行番号
vim.o.number = true
vim.o.relativenumber = true
-- 自動インデント
vim.o.smartindent = true
-- OSのクリップボードと同期
vim.o.clipboard = "unnamed"
-- 制御文字を可視化
vim.o.list = true
-- タブキー押下時、タブ文字でなくスペースを入力
vim.o.expandtab = true
-- タブ文字の表示幅
vim.o.tabstop = 2
-- インデントの幅
vim.o.shiftwidth = 2
-- 画面端での折り返し
vim.o.wrap = false
-- フルカラー表示
vim.o.termguicolors = true
-- 補完候補の見た目
vim.o.wildmenu = true
-- 行数、列数表示
vim.o.ruler = true
-- 検索時の大文字、小文字の取り扱い
vim.o.smartcase = true
-- 対応する括弧を強調
vim.o.showmatch = true

-- リーダーキー
vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

-- ノーマルモードに戻った時にIMEをオフにする
if vim.fn.has('mac') == 1 then
  vim.api.nvim_create_autocmd({ "FocusGained", "InsertLeave", "CmdlineLeave" }, {
    callback = function()
      -- macOS用 (英数キーボード: com.apple.keylayout.ABC)
      vim.fn.system("im-select com.apple.keylayout.ABC")
    end,
  })
end

-- base.lua を開く
vim.api.nvim_create_user_command('VimrcBase', function()
  local config_dir = vim.fn.stdpath('config')
  vim.cmd.edit(config_dir .. '/lua/base.lua')
end,
{ desc = "Open base.lua" })
