local ok, telescope = pcall(require, "telescope")
if (not ok) then
    return 
end

local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules"
        },
        prompt_prefix = " ",
        entry_prefix = "  ",
        path_display = { "smart" },
        layout_strategy = "flex",
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
            n = {
                ["<esc>"] = actions.close,
            }
        }
    },
}
