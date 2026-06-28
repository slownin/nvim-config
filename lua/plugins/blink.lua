return {
  "Saghen/blink.cmp",
  version = "*",
  event = "InsertEnter",
  opts = {
    keymap = { preset = "default" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}
