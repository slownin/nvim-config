--- 実行環境がmacosか否か判定
-- @return boolean true: macos, false: macos以外
local function macp()
  return vim.fn.has('mac') == 1 ~= nil
end

--- 実行環境がWindowsか否か判定
-- @return boolean true: Windows, false: Windows以外
local function windowsp()
  return vim.fn.has('win32') == 1 ~= nil
end

-- Leaderキー
vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

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
vim.o.winblend = 0
vim.o.pumblend = 0

-- 補完候補の見た目
vim.o.wildmenu = true

-- 行数、列数表示
vim.o.ruler = true

-- 検索時の大文字、小文字の取り扱い
vim.o.smartcase = true

-- 対応する括弧を強調
vim.o.showmatch = true

-- ノーマルモードに戻った時にIMEをオフにする
vim.api.nvim_create_autocmd({ "FocusGained", "InsertLeave", "CmdlineLeave" }, {
  callback = function()
    if macp() then
      -- im-selectをインストール
      -- $ brew tap daipeihust/tap && brew trust daipeihust/tap && brew install im-select
      vim.fn.system("im-select com.apple.keylayout.ABC")
    elseif windowsp() then
      -- zenhan.exe をパスが通っている場所に配置
      -- https://github.com/iuchim/zenhan
      vim.fn.system("zenhan.exe 0")
    end
  end,
})
