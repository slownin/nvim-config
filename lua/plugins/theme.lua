return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    require('kanagawa').setup({
      compile = false,
      background = { dark = "wave", light = "wave" },
      transparent = true,
    })

    vim.cmd('colorscheme kanagawa')
  end,
}
