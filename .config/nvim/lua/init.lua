-- ---------------------------------------------------------------------------
-- experimental
-- ---------------------------------------------------------------------------
-- require('opts')
-- require('pkgs')
-- require('keys')
-- require('style')

-- ---------------------------------------------------------------------------
-- main
-- ---------------------------------------------------------------------------
require('packages')
vim.g.neovide_cursor_animation_length=0.0
vim.g.neovide_cursor_trail_length=0.01
vim.o.guifont = "JetBrainsMono Nerd Font"

-- FIXME: Get bare repo detection working
-- Seems the ret of the jobwait is always same, likely API difference?
-- local cwd = vim.fn.getcwd()
-- print(cwd)
-- NOTE: To work with bare repos we use the work around here
-- https://github.com/lewis6991/gitsigns.nvim/issues/397#issuecomment-1003631236
-- local jid = vim.fn.jobstart({ "git", "rev-parse", "--is-inside-work-tree" })
-- print(jid)
-- local ret = vim.fn.jobwait({jid})[1]
-- print(ret)
-- if ret == 0 then
--     vim.env.GIT_DIR = vim.fn.expand("~/.git")
--     vim.env.GIT_WORK_TREE = vim.fn.expand("~")
-- end
