vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt 

opt.number = true 
opt.relativenumber = true 

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true 
opt.softtabstop = 4

opt.autoindent = true 

opt.ignorecase = true 
opt.smartcase = true 

opt.cursorline = true 
opt.termguicolors = true 
opt.background = "dark"
opt.signcolumn = "yes"


-- change backspacae behavior - idk what it does rn but just in
-- case i need it in future
-- opt.backspace = "indent,eol,start"

opt.splitright = true 
opt.splitbelow = true 

opt.clipboard = "unnamedplus"
