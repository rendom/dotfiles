"if !exists('g:loaded_nvim_treesitter')
"  echom "Not loaded treesitter"
"  finish
"endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "typescript",
    "gomod",
    "go",
    "php",
    "javascript",
    "typescript",
    "html",
    "scss",
    "vue",
    "lua",
    "vim",
  },

}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
EOF
