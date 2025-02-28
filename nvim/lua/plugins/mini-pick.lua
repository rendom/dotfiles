return {  
'echasnovski/mini.pick',
  version = false,
  dependencies = { { 'echasnovski/mini.extra', version = false } },
  --
  config = function()
    require('mini.pick').setup()
    require('mini.extra').setup()
  end,

  keys = {
    { "<leader>t", "<cmd>Pick files<cr>", desc = "List files" },
    { "<leader>g", "<cmd>Pick grep<cr>", desc = "Grep" },
    { "<leader>b", "<cmd>Pick buffers<cr>", desc = "Buffer" },
  },
}
