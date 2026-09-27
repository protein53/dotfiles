return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },

		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},

			current_line_blame = false,
			signcolumn = true,
			numhl = false,
			linehl = false,
		},

		keys = {
			{
				"]h",
				function()
					require("gitsigns").next_hunk()
				end,
				desc = "Next Git Hunk",
			},

			{
				"[h",
				function()
					require("gitsigns").prev_hunk()
				end,
				desc = "Previous Git Hunk",
			},

			{
				"<leader>hs",
				function()
					require("gitsigns").stage_hunk()
				end,
				desc = "Stage Hunk",
			},

			{
				"<leader>hr",
				function()
					require("gitsigns").reset_hunk()
				end,
				desc = "Reset Hunk",
			},

			{
				"<leader>hp",
				function()
					require("gitsigns").preview_hunk()
				end,
				desc = "Preview Hunk",
			},

			{
				"<leader>hb",
				function()
					require("gitsigns").blame_line()
				end,
				desc = "Blame Line",
			},
		},
	},
}
