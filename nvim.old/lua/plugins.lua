-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local function get_config(name)
  return string.format('require("config/%s")', name)
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use {
      'nvim-treesitter/nvim-treesitter-context',
      requires = 'nvim-treesitter/nvim-treesitter'
  }

    use {
        "pmizio/typescript-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("typescript-tools").setup {}
        end,
    }

  use_rocks { 'xml2lua' }
  use {
      'andythigpen/nvim-coverage',
      requires = 'nvim-lua/plenary.nvim',
  }

    use {
        'jose-elias-alvarez/null-ls.nvim',
          requires = 'nvim-lua/plenary.nvim',
        "jay-babu/mason-null-ls.nvim",
    }

    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    }

    -- use 'rafamadriz/neon'
    -- use 'sainnhe/sonokai'
    use 'marko-cerovac/material.nvim'

  -- use 'SirVer/ultisnips'
  -- use { 'honza/vim-snippets', requires = 'SirVer/ultisnips' }
  -- use { 'markwu/vim-laravel4-snippets', requires = 'SirVer/ultisnips', ft = {'php'} }

  use({
      "ray-x/go.nvim",
      requires = "ray-x/guihua.lua",
      config = get_config("go"),
      ft = { "go" }
  })
  -- use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
  --
  -- use({
  --   "TimUntersberger/neogit",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     {
  --       "sindrets/diffview.nvim",
  --       cmd = {
  --         "DiffviewOpen",
  --         "DiffviewClose",
  --         "DiffviewToggleFiles",
  --         "DiffviewFocusFiles",
  --       },
  --       config = get_config("git.diffview"),
  --     },
  --   },
  --   module = "neogit",
  --   config = get_config("git.neogit"),
  -- })

  -- use { 'neoclide/coc.nvim', branch = 'release' }
  -- use { 'neoclide/coc-denite', requires = 'neoclide/coc.nvim' }
  --
  -- use 'williamboman/nvim-lsp-installer'
  -- use {'neovim/nvim-lspconfig'}

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

  -- use {
  --     "williamboman/nvim-lsp-installer",
  --     {
  --         "neovim/nvim-lspconfig",
  --     }
  -- }
  use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })


  use({ "rafamadriz/friendly-snippets" })

    use {
        -- 'golang/vscode-go',
        -- 'hrsh7th/vim-vsnip',
        -- 'hrsh7th/vim-vsnip-integ',
    }
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})

 use {
    'hrsh7th/nvim-cmp',
    requires = {
        'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
        'hrsh7th/cmp-nvim-lsp-signature-help',
        -- 'hrsh7th/cmp-vsnip',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp-document-symbol',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-cmdline'
    },
    -- requires = {
    --     "quangnguyen30192/cmp-nvim-ultisnips",
    --     config = function()
    --         require("cmp_nvim_ultisnips").setup{}
    --     end,
    -- }
}-- Autocompletion plugin

use {'doxnit/cmp-luasnip-choice'}

use 'folke/lsp-colors.nvim'
use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
}

use 'f-person/git-blame.nvim'
use 'nvim-lualine/lualine.nvim'

  -- use 'xolox/vim-misc'

  use 'talek/obvious-resize'
  use 'c0r73x/vimdir.vim'
  use 'dockyard/vim-easydir'
  -- use 'rendom/vvt.nu-vim'
  use 'rking/ag.vim'


  use 'jreybert/vimagit'


  use 't9md/vim-choosewin'
  use 'editorconfig/editorconfig-vim'
  use 'kopischke/vim-fetch'
  use 'machakann/vim-sandwich'
  use 'tpope/vim-repeat'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-eunuch'
  use 'ironhouzi/vim-stim'
  use 'wellle/visual-split.vim'

  use 'janko-m/vim-test'


  use { 'captbaritone/better-indent-support-for-php-with-html', ft = {'php'} }

  use 'konfekt/fastfold'
  use 'johnsyweb/vim-makeshift'

  use 'AndrewRadev/splitjoin.vim'

  use {'jparise/vim-graphql', ft = {'graphql'} }


  use 'sheerun/vim-polyglot'

  use { 'Shougo/vimproc.vim', run = 'make' }
  use { 'Shougo/denite.nvim', run = ':UpdateRemotePlugins' }

  -- use 'itchyny/lightline.vim'
  -- use 'itchyny/vim-gitbranch'
  use 'hecal3/vim-leader-guide'
end)
