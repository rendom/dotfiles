local lspServers = {
    'gopls',
    'golangci_lint_ls',
    'jsonls',
    'tsserver',
    'volar',
    'eslint',
    'intelephense',
    -- 'sumneko_lua',
    'dockerls',
    'bashls',
    'cssls',
    'yamlls',
    'lemminx',
    'null_ls',
    -- 'psalm',
}
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup {
    ensure_installed = lspServers,
}

lspconfig = require "lspconfig"
util = require "lspconfig/util"

-- -- Mappings.
local opts = { noremap=true, silent=true }
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
-- 
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
   -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

    vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            callback = function()
                local opts = {
                    focusable = false,
                    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                    border = 'rounded',
                    source = 'always',
                    prefix = ' ',
                    noremap = true,
                    silent = true,
                    -- scope = 'cursor',
                }
                vim.diagnostic.open_float(nil, opts)
            end
        })
end
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, lsp in pairs(lspServers) do
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    if lsp == 'intelephense' then
        opts.settings = {
            intelephense = {
                files = {
                    maxSize = 10000000;
                };
            };
        }
    end

    require('lspconfig')[lsp].setup(opts)
    
end

vim.diagnostic.config({
  virtual_text = false,
  -- signs = true,
  underline = false,
  -- update_in_insert = false,
  -- severity_sort = false,
})



-- local lspServers = {
--     'gopls',
--     'golangci_lint_ls',
--     'jsonls',
--     'tsserver',
--     'volar',
--     'eslint',
--     'intelephense',
--     'sumneko_lua',
--     'dockerls',
--     'bashls',
--     'cssls',
--     'yamlls',
--     'lemminx',
--     -- 'psalm',
-- 
-- }
-- 
-- require("nvim-lsp-installer").setup {
--     automatic_installation = true,
--     -- 'intelephense', 
--     ensure_installed = lspServers,
--     ui = {
--         icons = {
--             server_installed = "?",
--             server_pending = "?",
--             server_uninstalled = "?"
--         }
--     }
-- }
-- 
-- lspconfig = require "lspconfig"
-- util = require "lspconfig/util"
-- 
-- -- -- Mappings.
-- local opts = { noremap=true, silent=true }
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- -- vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- -- vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- -- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
-- -- 
-- -- -- Use an on_attach function to only map the following keys
-- -- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
-- 
--     -- Mappings.
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- 
--     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
-- 
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--     vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--     vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
-- 
--     vim.api.nvim_create_autocmd("CursorHold", {
--             buffer = bufnr,
--             callback = function()
--                 local opts = {
--                     focusable = false,
--                     close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--                     border = 'rounded',
--                     source = 'always',
--                     prefix = ' ',
--                     noremap = true,
--                     silent = true,
--                     -- scope = 'cursor',
--                 }
--                 vim.diagnostic.open_float(nil, opts)
--             end
--         })
-- end
-- 
-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- -- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
-- -- for _, lsp in pairs(servers) do
-- --   require('lspconfig')[lsp].setup {
-- --     on_attach = on_attach,
-- --     flags = {
-- --       -- This will be the default in neovim 0.7+
-- --       debounce_text_changes = 150,
-- --     }
-- --   }
-- -- end
-- 
-- 
-- -- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- -- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- for _, lsp in pairs(lspServers) do
--     local opts = {
--         on_attach = on_attach,
--         capabilities = capabilities,
--     }
-- 
--     if lsp == 'intelephense' then
--         opts.settings = {
--             intelephense = {
--                 files = {
--                     maxSize = 10000000;
--                 };
--             };
--         }
--     end
-- 
--     require('lspconfig')[lsp].setup(opts)
--     
-- end
-- 
-- vim.diagnostic.config({
--   virtual_text = false,
--   -- signs = true,
--   underline = false,
--   -- update_in_insert = false,
--   -- severity_sort = false,
-- })
-- 
-- 
-- --vim.o.updatetime = 250
-- --vim.cmd [[autocmd CursorHold,CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
-- 
-- 
-- -- lsp_installer.on_server_ready(function(server)
-- --     local opts = { }
-- --     server:setup(opts)
-- --     vim.cmd([[ do User LspAttach Buffers ]])
-- -- end)
-- 
-- -- require("nvim-lsp-installer").setup {
-- --     automatic_installation = true,
-- --     ensure_installed = {'intelephense', 'gopls', 'golangci_lint_ls', 'jsonls', 'tsserver', 'volar'},
-- --     ui = {
-- --         icons = {
-- --             server_installed = "?",
-- --             server_pending = "?",
-- --             server_uninstalled = "?"
-- --         }
-- --     }
-- -- }
-- 
-- -- -- -- Mappings.
-- -- -- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- -- local opts = { noremap=true, silent=true }
-- -- -- vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- -- -- vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- -- -- vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- -- -- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
-- -- -- 
-- -- -- -- Use an on_attach function to only map the following keys
-- -- -- -- after the language server attaches to the current buffer
-- -- local on_attach = function(client, bufnr)
-- --     -- Enable completion triggered by <c-x><c-o>
-- --     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
-- -- 
-- --     -- Mappings.
-- --     -- See `:help vim.lsp.*` for documentation on any of the below functions
-- --     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- --     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- --     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- --     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- --     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- --     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- --     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- --     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- --     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- --     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- --     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- --     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- --     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
-- -- end
-- -- 
-- -- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- -- map buffer local keybindings when the language server attaches
-- -- -- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
-- -- -- for _, lsp in pairs(servers) do
-- -- --   require('lspconfig')[lsp].setup {
-- -- --     on_attach = on_attach,
-- -- --     flags = {
-- -- --       -- This will be the default in neovim 0.7+
-- -- --       debounce_text_changes = 150,
-- -- --     }
-- -- --   }
-- -- -- end
-- -- 
-- -- lspconfig = require "lspconfig"
-- -- util = require "lspconfig/util"
-- -- local function create_capabilities(opts)
-- --     local default_opts = {
-- --         with_snippet_support = true,
-- --     }
-- --     opts = opts or default_opts
-- --     local capabilities = vim.lsp.protocol.make_client_capabilities()
-- --     capabilities.textDocument.completion.completionItem.snippetSupport = opts.with_snippet_support
-- --     if opts.with_snippet_support then
-- --         capabilities.textDocument.completion.completionItem.resolveSupport = {
-- --             properties = {
-- --                 "documentation",
-- --                 "detail",
-- --                 "additionalTextEdits",
-- --             },
-- --         }
-- --     end
-- --     return cmp_lsp.update_capabilities(capabilities)
-- -- end
-- -- 
-- -- util.on_setup = util.add_hook_after(util.on_setup, function(config)
-- --     if config.on_attach then
-- --         config.on_attach = util.add_hook_after(config.on_attach, common_on_attach)
-- --     else
-- --         config.on_attach = common_on_attach
-- --     end
-- --     config.capabilities = create_capabilities()
-- -- end)
