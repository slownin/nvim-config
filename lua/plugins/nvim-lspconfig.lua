return {
  "neovim/nvim-lspconfig",
  -- 💡 依存関係を指定することで、必ず cmp と mason が先に読み込まれます
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- ポップアップのボーダー設定（Kキー、Ctrl+s）
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, { buffer = ev.buf, desc = "LSP Hover" })
        vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help({ border = "rounded" }) end, { buffer = ev.buf, desc = "LSP Signature Help" })
      end,
    })

    -- 管理するLSPサーバーのリスト
    local servers = {
      "lua_ls",
      "pyright",
      "html",
      "cssls",
    }

    -- 各言語ごとの特殊な個別設定
    local server_settings = {
      ["lua_ls"] = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      ["pyright"] = {
        python = {
          analysis = { autoSearchPaths = true, useLibraryCodeForTypes = true, diagnosticMode = "workspace" },
        },
      },
    }

    -- 一括セットアップ
    require("mason-lspconfig").setup({
      ensure_installed = servers,
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            settings = server_settings[server_name],
          })
        end,
      }
    })
  end,
}
