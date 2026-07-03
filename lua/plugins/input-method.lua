return {
  {
    "keaising/im-select.nvim",
    cond = vim.fn.has("mac") == 1,
    config = function()
      require("im_select").setup({})
    end,
  },
  {
    "drop-stones/im-switch.nvim",
    cond = vim.fn.has("win32") == 1,
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
    }
  },
}
