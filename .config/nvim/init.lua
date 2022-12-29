-- NOTE: Useful notes https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/


if (vim.g.vscode ~= nil) then
    do return end
end

-- ---------------------------------------------------------------------------
-- pre package config
-- ---------------------------------------------------------------------------
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.background = 'dark'


vim.cmd([[
try
    colorscheme hadalized
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry
]])

vim.cmd([[
autocmd filetype nix setlocal commentstring=#\ %s
autocmd filetype cfg setlocal commentstring=#\ %s
autocmd filetype sql setlocal commentstring=--\ %s
autocmd filetype pgsql setlocal commentstring=--\ %s
autocmd filetype xdefaults setlocal commentstring=!\ %s
autocmd filetype groovy setlocal commentstring=//\ %s
autocmd filetype jenkinsfile setlocal commentstring=//\ %s

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
filetype indent on
]])

-- ---------------------------------------------------------------------------
-- load packages
-- ---------------------------------------------------------------------------
require('packages')



-- ---------------------------------------------------------------------------
-- post package config
-- ---------------------------------------------------------------------------

vim.g.neovide_cursor_animation_length=0.0
vim.g.neovide_cursor_trail_length=0.01
vim.g.tex_flavor = 'latex'
vim.g.sql_type_default = 'pgsql'
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.ackprg = 'rg --vimgrep --no-heading -uu'

vim.opt.autochdir = true
vim.opt.autowrite = false --  write when moving to other buffers/windows
vim.opt.clipboard:append('unnamedplus')
vim.opt.colorcolumn = '+1'
vim.opt.completeopt = {'noinsert', 'menuone', 'noselect'}
vim.opt.confirm = true
vim.opt.expandtab = true
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = 'indent'
vim.opt.foldnestmax = 8
vim.opt.formatoptions:remove('tc')
vim.opt.guifont = "JetBrainsMono Nerd Font"
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'nosplit'
vim.opt.linebreak = true
vim.opt.modeline = false  -- security risk?
vim.opt.mouse='a'
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.pumblend = 10
vim.opt.scrolljump = 1
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 4
vim.opt.shortmess:append('A')
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.textwidth = 79
vim.opt.title = true
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.wildmenu = true
vim.opt.wildoptions = 'pum'
vim.opt.wrap = false


vim.opt.listchars = {
    tab = '>-',
    trail = '·',
    extends = '◣',
    precedes = '◢',
    nbsp = '○',
    eol = '↵',
}

vim.opt.wildignore = {
    '*.DS_Store',
    '.git',
    '.hg',
    '.svn',
    '*.o',
    '*.obj',
    '*.exe',
    '*.pyc',
    '*.luac',
    '*.class',
    '*/target/*',
}

-- default lualine seems sensible enough for now.
-- local statusline = {
--     '%{mode()} | ',
--     'b:%n | ',
--     ' %F |',
--     -- '%{fugitive#statusline()}',
--     '%=',
--     '%{&fenc} | ',
--     '{&ff} | ',
--     '%h',
--     '%m',
--     '%w',
--     '%r',
--     '%y',
--     '%p%% %l:%c',
--     '#warningmsg#',
--     '%*',
-- }
-- vim.opt.statusline = table.concat(statusline, '')
