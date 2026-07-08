return {
  "drop-stones/im-switch.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
  opts = {
    macos = {
      default_im = "com.apple.keylayout.ABC",
    }
  },
  config = function(_, opts)
    require("im-switch").setup(opts)

    -- ノーマルモードではIMをオンにできなくする
    local notify = require("im-switch.utils.notify")
    local default_im_value = require("im-switch.platforms").get_platform().default_im_value(opts)
    local im_command = require("im-switch.utils.im_command")
    local system = require("im-switch.utils.system")

    local command, err = im_command.get_im_command("set", default_im_value)
    if err then
      notify.error(err)
      return false
    end

    vim.api.nvim_create_autocmd({ "SafeState", "CursorMoved", "WinEnter" }, {
      pattern = "*",
      callback = function()
        local current_mode = vim.api.nvim_get_mode().mode
        if current_mode == "n" then
          system.run_system(command)
        end
      end,
    })
  end,
}
