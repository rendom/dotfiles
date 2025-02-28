local diagSigns = {
  [vim.diagnostic.severity.ERROR] = '',
  [vim.diagnostic.severity.WARN] = '⚠',
  [vim.diagnostic.severity.INFO] = '',
  [vim.diagnostic.severity.HINT] = '',
}

vim.diagnostic.config({
  severity_sort = true,
  underline = true,
  update_in_insert = false,
  virtual_lines = {
    current_line = true,
    format = function(diag)
      local sign = diagSigns[diag.severity]
      if diag.code then
        local code = diag.code
        diag.code = nil
        return sign .." ".. diag.message .. "["..diag.source.."] ("..code..")"
      end
      return sign .." ".. diag.message .. "["..diag.source.."]"
    end,
  },
  jump = {
    float = false,
    wrap = true,
  },
  signs = {
    text = diagSigns,
  }
})
