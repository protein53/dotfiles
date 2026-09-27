return {
  "numToStr/Comment.nvim",
  -- Set keys so lazy.nvim knows to lazy-load the plugin when you press the shortcut
  keys = {
    { "<leader>c", mode = { "n", "v" }, desc = "Toggle comment" },
  },
  config = function()
    -- 1. Initialize Comment.nvim with your preferred configuration options
    local comment = require("Comment")
    comment.setup({
      -- Disable the default mappings so they don't conflict with your custom ones
      mappings = {
        basic = false,
        extra = false,
      },
    })

    -- 2. Define the AstroNvim-style mappings using Neovim's native Lua API
    
    -- Normal Mode: Toggle comment on the current line
    vim.keymap.set("n", "<leader>c", function()
      require("Comment.api").toggle.linewise.current()
    end, { desc = "Toggle comment line" })

    -- Visual Mode: Toggle comment on the visually selected region
    vim.keymap.set("v", "<leader>c", function()
      -- Escape to normal mode first so that the '< and '> visual marks are updated
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "nx", false)
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end, { desc = "Toggle comment selection" })
  end,
}
