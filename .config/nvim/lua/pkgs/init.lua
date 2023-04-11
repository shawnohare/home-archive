return {
    -- common deps used by many plugins.
    { "nvim-lua/popup.nvim", lazy = true },
    { "nvim-lua/plenary.nvim", lazy = true },
    { "nvim-tree/nvim-web-devicons", lazy = true },

    { "github/copilot.vim" },
    { "rktjmp/shipwright.nvim", lazy = true },
    { "shawnohare/hadalized.nvim", priority = 1000, dependencies = { "rktjmp/lush.nvim" } },
    { "numToStr/Comment.nvim", opts = {} },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        ft = "norg",
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.norg.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                    },
                },
            },
        },
        -- dependencies = { { "nvim-lua/plenary.nvim" } },
    },
    {
        "nvim-lualine/lualine.nvim",
        -- dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    { "windwp/nvim-autopairs", opts = {} },
    { "folke/trouble.nvim", opts = {} },
    {
        "folke/todo-comments.nvim",
        -- dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            highlight = {
                before = "", -- "fg" or "bg" or empty
                keyword = "wide", -- "wide" or "bg" or empty. (wide is the same as bg, but will also highlight surrounding characters)
                after = "", -- "fg" or "bg" or empty
                pattern = [[.*<(KEYWORDS).*:]], -- pattern used for highlightng (vim regex)
                comments_only = true, -- uses treesitter to match keywords in comments only
                max_line_len = 400, -- ignore lines longer than this
                exclude = {}, -- list of file types to exclude highlighting
            },
        },
    },
    { "lewis6991/spaceless.nvim", opts = {} },
    { "lewis6991/gitsigns.nvim", lazy = true, opts = {} },
    { 'TimUntersberger/neogit', lazy = true, opts = {} },
    { "nvim-tree/nvim-tree.lua", lazy = true, opts = {} },

}
