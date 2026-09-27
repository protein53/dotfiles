-- lua/config/keymaps.lua

local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Better search navigation
map("n", "n", "nzzzv")

-- Oil keymap
map("n", "<leader>O", "<Cmd>Oil .<CR>")

-- Better buffer navigation similar to leap.nvim
map("n", "<leader>s", "<Cmd>BufferPick<CR>", { desc = "leap to buffer"})
map("n", "<leader>S", "<Cmd>BufferPickDelete<CR>", { desc = "delete buffer"})

-- Better line navigation and display positioning
map("n", "o", "%")
map("n", "T", "zt")
map("n", "E", "$")
map("n", "B", "^")

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })

-- Quickfix list
map("n", "]q", "<cmd>cnext<CR>", { desc = "Next quickfix" })
map("n", "[q", "<cmd>cprev<CR>", { desc = "Previous quickfix" })
