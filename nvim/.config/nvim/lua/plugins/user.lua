-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {
  {
  "vhyrro/luarocks.nvim",
  priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
  config = true,
  },
  {
    "folke/flash.nvim",
    keys = {
      { "T", mode = { "n", "x", "o" }, false },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      keys = { "o", false },
    },
  },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "kevinhwang91/nvim-ufo", enabled = false }, 
  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            " █████  ███████ ████████ ██████   ██████ ",
            "██   ██ ██         ██    ██   ██ ██    ██",
            "███████ ███████    ██    ██████  ██    ██",
            "██   ██      ██    ██    ██   ██ ██    ██",
            "██   ██ ███████    ██    ██   ██  ██████ ",
            "",
            "███    ██ ██    ██ ██ ███    ███",
            "████   ██ ██    ██ ██ ████  ████",
            "██ ██  ██ ██    ██ ██ ██ ████ ██",
            "██  ██ ██  ██  ██  ██ ██  ██  ██",
            "██   ████   ████   ██ ██      ██",
          }, "\n"),
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })

      -- include the default astronvim config that calls the setup call
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
  },  
   {
     "hrsh7th/nvim-cmp",
     opts = function(_, opts)
       local cmp = require("cmp")
       local luasnip = require("luasnip")

       -- helper: check character under cursor
       local function char_under_cursor()
         local col = vim.api.nvim_win_get_cursor(0)[2] + 1
         local line = vim.api.nvim_get_current_line()
         return line:sub(col, col)
       end

       local brackets_close = { [')'] = true, [']'] = true, ['}'] = true, ['"'] = true, ['>'] = true }
       local brackets_open = { ['('] = true, ['['] = true, ['{'] = true, ['"'] = true, ['<'] = true }
       -- override <Tab>
       opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
         local ch = char_under_cursor()

         -- YOUR CUSTOM CONDITION FIRST
                        
         if brackets_open[ch] then
              vim.cmd.normal { args = { "xbP" }, bang = true }
              return
         end
         -- original AstroNvim behavior preserved
         if cmp.visible() then
           cmp.select_next_item()
         elseif luasnip.expand_or_jumpable() then
           luasnip.expand_or_jump()
         else
           fallback()
         end
       end, { "i", "s" })
       -- override <S-Tab>
       opts.mapping["S-<Tab>"] = cmp.mapping(function(fallback)
         local ch = char_under_cursor()

         -- YOUR CUSTOM CONDITION FIRST
                        
         if brackets_close[ch] then
              vim.cmd.normal { args = { "xep" }, bang = true }
              return
         end
         -- original AstroNvim behavior preserved
         if cmp.visible() then
           cmp.select_prev_item()
         elseif luasnip.expand_or_jumpable() then
           luasnip.expand_or_jump()
         else
           fallback()
         end
       end, { "i", "s" })
   },
}
