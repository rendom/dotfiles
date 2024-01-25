--local mason_null_ls = require("mason-null-ls")
--
--mason_null_ls.setup({
--	automatic_installation = true,
--	ensure_installed = {
--        "phpstan"
--	},
--})
--
local null_ls = require("null-ls")




null_ls.builtins.formatting.djhtml.with({
    extra_args = function(params)
        return {
            "--tabwidth",
            vim.api.nvim_buf_get_option(params.bufnr, "shiftwidth"),
        }
    end,
})

null_ls.setup({
    debug = true,
    sources = {
        --null_ls.builtins.formatting,
        null_ls.builtins.diagnostics.phpstan.with({
            timeout = 30000,
            extra_args = {"--memory-limit=2G"},
        })
    },
})
