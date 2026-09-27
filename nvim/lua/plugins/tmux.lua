return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Window left" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Window down" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Window up" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Window right" },
  },
  init = function()
    -- This runs immediately during startup so terminal maps are registered
    vim.api.nvim_create_autocmd("TermOpen", {
      group = vim.api.nvim_create_augroup("tmux-navigator-terminal", { clear = true }),
      callback = function()
        local opts = { buffer = 0, silent = true }
        vim.keymap.set("t", "<C-h>", [[<C-\><C-n>:TmuxNavigateLeft<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<C-\><C-n>:TmuxNavigateDown<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<C-\><C-n>:TmuxNavigateUp<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<C-\><C-n>:TmuxNavigateRight<CR>]], opts)
      end,
    })
  end,
}

