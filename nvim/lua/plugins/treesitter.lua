return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"python",
				"vim",
				"lua",
				"bash",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
	},
}
