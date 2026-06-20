vim.api.nvim_create_user_command('TabWidth2', function()
  vim.o.tabstop = 2
  vim.o.shiftwidth = 2
end,
{ desc = "インデント幅を2に設定" })

vim.api.nvim_create_user_command('TabWidth4', function()
  vim.o.tabstop = 4
  vim.o.shiftwidth = 4
end,
{ desc = "インデント幅を4に設定" })
