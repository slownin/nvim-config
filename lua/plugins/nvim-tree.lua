return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  opts = {
    sync_root_with_cwd = true,
    filesystem_watchers = {
      enable = false,
    },
    git = {
      enable = false,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  },
}
