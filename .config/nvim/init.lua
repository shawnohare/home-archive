-- NOTE: Useful notes https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/


if (vim.g.vscode ~= nil) then
    do return end
end

-- ---------------------------------------------------------------------------
-- pre package config
-- ---------------------------------------------------------------------------
vim.g.mapleader = " "
vim.o.termguicolors = true
vim.o.background = 'dark'


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

vim.o.autochdir = true
vim.o.autowrite = false --  write when moving to other buffers/windows
vim.o.colorcolumn = '+1'
vim.o.confirm = true
vim.o.expandtab = true
vim.o.foldcolumn = "1"
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.foldmethod = 'indent'
vim.o.foldnestmax = 8
vim.o.guifont = "JetBrainsMono Nerd Font"
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.inccommand = 'nosplit'
vim.o.linebreak = true
vim.o.modeline = false  -- security risk?
vim.o.mouse='a'
vim.o.number = true
vim.o.numberwidth = 4
vim.o.pumblend = 10
vim.o.scrolljump = 1
vim.o.scrolloff = 5
vim.o.shiftwidth = 4
vim.o.showcmd = true
vim.o.showmode = true
vim.o.smartcase = true
vim.o.softtabstop = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.textwidth = 79
vim.o.title = true
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.wildmenu = true
vim.o.wildoptions = 'pum'
vim.o.wrap = false

vim.opt.completeopt = {'noinsert', 'menuone', 'noselect'}
vim.opt.clipboard:append('unnamedplus')
vim.opt.shortmess:append('A')
vim.opt.formatoptions:remove('tc')

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
