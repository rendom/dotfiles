return {
  'stevearc/conform.nvim',
  ft = "go",
  opts = {
    formatters_by_ft = {
      go = { "gofmt", "goimports" }
    }
  },
}
