return {
  {
    "aklt/plantuml-syntax",
    ft = { "plantuml", "puml" },
  },
  {
    "tyru/open-browser.vim",
    keys = {
      { "<Plug>(openbrowser-smart-search)", mode = { "n", "v" } },
    },
  },
  {
    "weirongxu/plantuml-previewer.vim",
    ft = { "plantuml", "puml" },
    dependencies = { "open-browser.vim" },
    config = function()
      vim.g["plantuml_previewer#plantuml_jar_path"] = "/path/to/plantuml.jar"
    end,
  }
}
