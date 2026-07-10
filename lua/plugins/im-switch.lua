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

    local has_focus = true
    local group = vim.api.nvim_create_augroup("ImSwitchFocusStrict", { clear = true })

    vim.api.nvim_create_autocmd("FocusGained", {
      group = group,
      callback = function() has_focus = true end,
    })

    vim.api.nvim_create_autocmd("FocusLost", {
      group = group,
      callback = function() has_focus = false end,
    })

    local timer = vim.loop.new_timer()
    if timer then
      timer:start(0, 200, vim.schedule_wrap(function()
        if has_focus and vim.api.nvim_get_mode().mode == "n" then
          system.run_system(command)
        end
      end))
    end

    vim.api.nvim_create_autocmd("VimLeavePre", {
      group = group,
      callback = function()
        if timer then
          timer:stop()
          timer:close()
        end
      end,
    })
  end,
}
