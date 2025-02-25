local buf = vim.api.nvim_create_buf(true, false)
vim.api.nvim_set_current_buf(buf)

-- vim.api.nvim_buf_set_name(buf, "./init.lua")
vim.cmd("edit " .. "init.lua")
