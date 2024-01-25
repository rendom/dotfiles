vim.g.gitblame_date_format = '%c'
vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
local git_blame = require('gitblame')

require('lualine').setup {
    -- options = {
    --     theme = 'sonokai'
    -- },
    sections = {
        lualine_a = {'mode', 'paste'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
            'filename',
        },
        lualine_x = {
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
            'filetype', 'encoding', 'fileformat'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
