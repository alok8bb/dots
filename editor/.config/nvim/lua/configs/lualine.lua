local ok, lualine = pcall(require, "lualine")
if (not ok) then 
    return 
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = "auto"
    },

    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' }, 
        lualine_c = { {
            'filename',
            file_status = true,
            path = 0
        }},

        lualine_x = {},
        lualine_y = {
            'progress'
        },
        lualine_z = { 'location' }
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{
            'filename',
            file_status = true,
            path = 1
        }},

        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
}
