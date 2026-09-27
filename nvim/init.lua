vim.g.mapleader = " "
vim.g.maplocalleader = ";"
require("config.options")
require("config.keymaps")
require("config.lazy")

-- Toggle a vertical terminal on the right side
local term_buf = nil
local term_win = nil

vim.keymap.set({ 'n', 't' }, '<leader>t', function()
  -- If terminal window is open, close it
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
    return
  end

  -- Move to the far right, split vertically, and open/reuse terminal
  vim.cmd('botright vsplit')
  term_win = vim.api.nvim_get_current_win()

  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.api.nvim_win_set_buf(term_win, term_buf)
  else
    vim.cmd('terminal')
    term_buf = vim.api.nvim_get_current_buf()
    -- Optional: Hide line numbers in the terminal
    vim.wo.number = false
    vim.wo.relativenumber = false
  end
  
  -- Automatically enter insert mode in the terminal
  vim.cmd('startinsert')
end, { desc = 'Toggle vertical terminal on the right' })
