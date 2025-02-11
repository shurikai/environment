-- local cfg = require 'stickies.config'
local ui = vim.api.nvim_list_uis()[1]

---@type vim.api.keyset.win_config
local default_window_config = {
  relative = 'editor',
  width = math.floor((ui.width * 0.4) + 0.5),
  height = math.floor((ui.height * 0.4) + 0.5),
  anchor = 'SE',
  row = ui.height - 1,
  col = ui.width - 1,
  zindex = 201, -- Just above message scrollback, but below cmdline completion popup.
  border = 'rounded',
  title = 'stickies',
  title_pos = 'left',
  footer = '... stickies ...',
  footer_pos = 'right',
}

---@class stickies.Window
---@field config? vim.api.keyset.win_config
---@field buf number|nil The buffer to be displayed in this window.
---@field win number|nil The window handle that is to be controlled by this instance.
local Window = {}

---@type vim.api.keyset.win_config
local config = default_window_config

local buf = nil
local win = nil

-- For now, accept a table (potentially non-empty) to make into a Window instance.
-- Possible future change would be to accept an options table and set those options
-- on a new table. This would at least guarantee a new object and not something that
-- could be operated on elsewhere (with side effects).
-- function Window:new(obj)
--   self.__index = self
--
--   local object = setmetatable({}, self)
--   local config = vim.deepcopy(obj or {})
--   object.config = vim.tbl_deep_extend('force', object.config, config)
--
--   print('Window.config: ' .. vim.inspect(self.config))
--   return object
-- end
--
-- function Window:is_open()
--   return self.win and vim.api.nvim_win_is_valid(self.win)
-- end
--
---Open a window with the given configuration.
---@param filename string The file to edit in the new window.
---@param override? vim.api.keyset.win_config Override values for the window configuration.
Window.open = function(filename, override)
  -- make sure that we don't open an extra window if it is already open.
  if win and vim.api.nvim_win_is_valid(win) then
    return
  end

  -- Merge the override configuration with the current configuration.
  if override ~= nil then
    config = vim.tbl_deep_extend('force', config, override)
  end

  -- Check the buffer and create one if it isn't valid.
  if not buf or not vim.api.nvim_buf_is_valid(buf) then
    buf = vim.api.nvim_create_buf(true, false)
  end

  -- print('the window config: ' .. vim.inspect(config))
  win = vim.api.nvim_open_win(buf, true, config)
  vim.api.nvim_set_current_buf(buf)

  vim.cmd('edit ' .. filename)
  vim.bo[buf].filetype = 'markdown'

  vim.api.nvim_create_autocmd('BufLeave', {
    callback = function(ev)
      -- print('Buffer Leave Event: ' .. vim.inspect(ev))
      vim.cmd 'silent! write'
    end,
    buffer = buf,
  })
end

---@param del boolean If del is true, delete the associated buffer.
Window.close = function(del)
  local _win = win
  local _buf = buf

  vim.schedule(function()
    if _win and vim.api.nvim_win_is_valid(_win) then
      vim.api.nvim_win_close(_win, true)
    end

    if del and _buf and vim.api.nvim_buf_is_valid(_buf) then
      vim.api.nvim_buf_delete(_buf, { force = true })
      buf = nil
    end
  end)
end

--[[ Test code. ]]
--

local buffer = vim.fn.bufadd './.editorconfig'
vim.api.nvim_set_option_value('bufhidden', 'hide', { buf = buffer })
print('buffer created: ' .. buffer)
--
Window.open('./.stylua.toml', {})
-- vim.defer_fn(function()
--   Window.close(true)
-- end, 9000)

return Window
