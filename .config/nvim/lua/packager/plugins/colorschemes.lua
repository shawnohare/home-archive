return {
    { "rktjmp/shipwright.nvim", lazy = true },
    {
        "shawnohare/hadalized.nvim",
        priority = 1000,
        dependencies = {
            "rktjmp/lush.nvim",
        },
    },
}
