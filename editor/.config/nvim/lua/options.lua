local opts = {
	fileencoding = "utf-8",
	shell = "zsh",

	nu = true,
	rnu = true,

	autoindent = true,
	hlsearch = true,

	backup = false,
	showcmd = true,
	swapfile = false,
	undofile = true,
	cmdheight = 1,
	laststatus = 2,
	scrolloff = 5,

	expandtab = true,
	shiftwidth = 4, 
	tabstop = 4,
	softtabstop = 4,
	smartindent = true,
	wrap = false,

	cursorline = false,
	termguicolors = true,
	background = 'dark',
	mouse = 'a',
	clipboard = "unnamedplus",
	showmode = false,
}

local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

for k, v in pairs(opts) do
	opt[k] = v
end
