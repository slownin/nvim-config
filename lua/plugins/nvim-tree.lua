return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    filesystem_watchers = {
      enable = false,
    },
    git = {
      enable = false,
    },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
}
