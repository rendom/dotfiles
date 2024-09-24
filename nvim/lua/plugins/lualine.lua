local git_blame = require('gitblame')

return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      globalstatus = true,
      icons_enabled = false,
      theme = 'onedark',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_x = {
        { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
        'filetype', 'encoding', 'fileformat'
      },
    },
  },
}

