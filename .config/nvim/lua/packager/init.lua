-- Bootstrap lazy.nvim
-- Need to set path when package loaded.
-- Technically
-- can load packages after requiring the module.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

local function setup()
    local opts = {
        defaults = {
            lazy = false,
        },
        -- lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
        dev = {
            path = "~/src",
        }
    }

    -- will load all plugins of form ../pkgs/*.lua
    require("lazy").setup("pkgs", opts)

end


return {
  setup = setup,
}
