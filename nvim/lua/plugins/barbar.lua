return {
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        event = "VeryLazy",

        opts = {
            animation = false,
            auto_hide = false,
            clickable = true,
            highlight_visible = true,
            highlight_inactive_file_icons = false,
            focus_on_close = "left",
            icons = {
                separator = {
                    left = "",
                    right = "",
                    button = 'x',
                },
            },
        },

        keys = {
            { "<leader>s", "<Cmd>BufferPick<CR>", desc = "Goto buffer" },
            { "<leader>S", "<Cmd>BufferPickDelete<CR>", desc = "Delete buffer" },
        },
    },
}
