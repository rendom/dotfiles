require("coverage").setup({
    lang = {
        php =  {
            coverage_file = 'coverage.xml',
        }
    }
})

-- require("coverage").setup({
-- 	commands = true, -- create commands
-- 	highlights = {
-- 		-- customize highlight groups created by the plugin
-- 		covered = { fg = "#C3E88D" },   -- supports style, fg, bg, sp (see :h highlight-gui)
-- 		uncovered = { fg = "#F07178" },
-- 	},
-- 	signs = {
-- 		-- use your own highlight groups or text markers
-- 		covered = { hl = "CoverageCovered", text = "?" },
-- 		uncovered = { hl = "CoverageUncovered", text = "?" },
-- 	},
-- 	summary = {
-- 		-- customize the summary pop-up
-- 		min_coverage = 80.0,      -- minimum coverage threshold (used for highlighting)
-- 	},
-- 	lang = {
-- 		-- customize language specific settings
--         php: {
--             coverage_file: 'coverage.xml',
--         }
-- 	},
-- })

-- require'coverage'.setup({
 --     commands: true,
 --     highlights: {
 --         uncovered: {
 --             fg: vim.g.terminal_color_1,
 --             bg: vim.g.terminal_color_0,
 --         },
 --         covered: {
 --             fg: vim.g.terminal_color_2,
 --             bg: vim.g.terminal_color_0,
 --         },
 --         summary_header: {
 --             fg: vim.g.terminal_color_15,
 --             style: 'bold,underline',
 --             sp: 'fg'
 --         },
 --         summary_fail: {
 --             link: 'NotifyERRORTitle',
 --         },
 --         summary_pass: {
 --             link: 'NotifySUCCESSTitle',
 --         },
 --     },
 --     signs: {
 --         covered: { hl: "CoverageCovered", text: "?" },
 --         uncovered: { hl: "CoverageUncovered", text: "?" },
 --     },
 --     summary: {
 --         min_coverage: 80.0,
 --     },
 --     lang: {
 --         php: {
 --             coverage_file: 'coverage.xml',
 --         }
 --     }
 -- })


-- Utils = require'utils'
--  Utils.nvim_create_augroups({
--      coverage: {
--          { 'FileType', 'php', 'lua require"functions".checkCoverage("coverage.xml")' },
--      }
--  })
