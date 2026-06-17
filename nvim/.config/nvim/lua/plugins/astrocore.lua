-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

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
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
        shiftwidth = 4,
        expandtab = true,
        hlsearch = true,
        tabstop = 4,
        linebreak = true,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        ["<C-S>"] = false,
        ["<right>"] = {
          ":let linenum=getpos('.')[1]|:wincmd l|:call cursor(linenum,0)<cr>",
          desc = "go to same line number at right pane",
        },
        ["<left>"] = {
          ":let linenum=getpos('.')[1]|:wincmd h|:call cursor(linenum,0)<cr>",
          desc = "go to same line number at left pane",
        },
        ["<up>"] = {
          ":let linenum=getpos('.')[1]|:wincmd k|:call cursor(linenum,0)<cr>",
          desc = "go to same line number at upper pane",
        },
        ["<down>"] = {
          ":let linenum=getpos('.')[1]|:wincmd j|:call cursor(linenum,0)<cr>",
          desc = "go to same line number at lower pane",
        },
        ["o"] = { "%", desc = "jump to opening/closing pair" },
        ["T"] = { "zt", desc = "move current line to top" },
        ["E"] = { "$", desc = "move cursor to end of line" },
        ["B"] = { "^", desc = "move cursor to beginning of line" },
        [">"] = { ">gv", desc = "retain selection after indentation" },
        ["<"] = { "<gv", desc = "retain selection after un-indentation" },
        ["<Leader>Z"] = { ":tab split<CR>", desc = "zoom into current pane" },
        ["<Leader>z"] = { "mAZZ'A<ESC>T", desc = "un-zoom" },            
      },
    },
  },
}
