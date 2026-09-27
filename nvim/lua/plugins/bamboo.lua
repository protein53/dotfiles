return {
  "ribru17/bamboo.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("bamboo").setup({
      -- Main options
      style = "vulgaris", -- 'vulgaris' (dark), 'multiplex' (darker), or 'icaria' (light)
      transparent = false, -- Show/hide background
      term_colors = true, -- Set terminal colors
      ending_tildes = false, -- Show the tilde characters for empty lines
      cmp_itemkind_reverse = false, -- Reverse item kind highlights in cmp

      -- Enable bold, italic, etc.
      style_preset = {
        italic = true,
        bold = true,
        comment = { italic = true },
      },

      -- Customize highlight groups if desired
      colors = {}, -- Override/add custom colors
      highlights = {}, -- Override highlight groups
    })
    
    -- Load the colorscheme
    vim.cmd([[colorscheme bamboo]])
  end,
}

