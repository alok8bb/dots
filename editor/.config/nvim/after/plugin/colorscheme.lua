local colorscheme = 'gruvbox'

require('gruvbox').setup({
    undercurl = false,
    underline = true,
    bold = true,
    italic = true,
    transparent_mode = true,
    constrast = "hard",
})

require('tokyonight').setup({
    transparent = true,
    terminal_colors = true,
    
    styles = {
        comments = { italic = true },
    },
})

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
    vim.notify("[err] colorscheme " .. colorscheme .. " not found!")
    return
end
