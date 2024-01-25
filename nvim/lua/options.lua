-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = ''

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.o.history = 1000
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
-- set nowrap
vim.o.linebreak = true
-- vim.o.backspace = 2 // TODO
vim.o.synmaxcol = 200
vim.o.colorcolumn = "80,120"

-- nocursorline
vim.o.list = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.conceallevel = 2
vim.o.concealcursor = "nc"

vim.o.hlsearch = true
vim.o.showmatch = true
vim.o.incsearch = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.inccommand = "split"

vim.o.shell = "/bin/zsh"
vim.o.wildmenu = true

-- vim.o.iskeyword += "_,$,@,%,#"

-- vim.o.foldmethod="syntax"
-- vim.o.fold
-- set foldenable
-- set foldlevel=100


-- vim: ts=2 sts=2 sw=2 et
