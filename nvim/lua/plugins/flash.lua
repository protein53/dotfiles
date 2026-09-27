return {
	{
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      modes = {
        char = { enabled = false, },
      },
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", false },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", false },
        { "<c-s>", false },
      },
},
}
