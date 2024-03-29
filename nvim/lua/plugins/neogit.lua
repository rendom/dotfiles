return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
  },
  config = true,
  init = function()

    vim.cmd([[
      cnoreabbrev Magit Neogit kind=vsplit
    ]])
  end
}
