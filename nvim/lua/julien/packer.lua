-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local function notInVScode()
    vim.g.vscode = vim.g.vscode or false
    return (not vim.g.vscode)
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- for finding projects files (cf. `after/plugin/telescope.lua`)
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        cond = notInVScode,
        requires = { { 'nvim-lua/plenary.nvim' } }
    })

    -- LSP:
    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-path' },     -- add by Julien
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
            { 'saadparwaiz1/cmp_luasnip' },
            { 'jalvesaq/cmp-nvim-r' },
            { 'onsails/lspkind.nvim' }

        }
    })

    -- Nice plugin to work with R
    use({
        "jalvesaq/Nvim-R",
        cond = notInVScode,
    })

    -- navigate between files
    use({
        'ThePrimeagen/harpoon',
        require = { { 'nvim-lua/plenary.nvim' } }
    })

    -- show help on available commands
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- colorscheme (cf. `after/plugin/colors.lua`)
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        cond = notInVScode,
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    })

    use({
        'rose-pine/neovim',
        as = "rose-pine",
        cond = notInVScode,
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- use ({
    --         'navarasu/onedark.nvim',
    --         as = "onedark",
    --         config = function()
    --       	  vim.cmd('colorscheme onedark')
    --         end
    -- })

    -- get indent lines
    use {
        'lukas-reineke/indent-blankline.nvim',
        cond = notInVScode
    }


    -- -- auto save file after edit
    -- use({
    --     "Pocco81/auto-save.nvim",
    -- })

    -- get the current context on top of the window
    use {
        'wellle/context.vim',
        cond = notInVScode
    }

    -- Status line (see `:help lualine.txt`)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- (cf. `after/plugin/treesitter.lua`)
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        cond = notInVScode
    })
    use({
        'nvim-treesitter/playground',
        cond = notInVScode
    })

    -- keep the history tree (cf. `after/plugin/undotree.lua`)
    use({
        'mbbill/undotree',
        cond = notInVScode
    })

    -- git in vim
    use({
        'tpope/vim-fugitive',
        cond = notInVScode
    })

    -- git indications
    use({
        -- 'lewis6991/gitsigns.nvim',
        'lewis6991/gitsigns.nvim',
        cond = notInVScode
    })

    -- add pairs of parenthesis
    use({
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    })

    -- comment code with gcc
    use({ 'tpope/vim-commentary' })

    -- auto-tab size
    use({ 'tpope/vim-sleuth' })

    -- use `s` for adding surrounding characters: for example:
    -- ysiw] you surround in word `]tpope/vim-surround`
    -- cs'" change surround ' by "
    use({ 'tpope/vim-surround' })

    -- vim game to be good
    use({
        'ThePrimeagen/vim-be-good',
        cond = notInVScode
    })

    -- user nvim in firefox
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }


    -- preview colors
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require 'colorizer'.setup { '*' } end
        -- use '*' to Highlight all files
        -- use '!vim' to exlude some fieltype (eg. vim)
    }
    -- csv files
    use {
        'cameron-wags/rainbow_csv.nvim',
        config = function()
            require 'rainbow_csv'.setup()
        end,
        -- optional lazy-loading below
        module = {
            'rainbow_csv',
            'rainbow_csv.fns'
        },
        ft = {
            'csv',
            'tsv',
            'csv_semicolon',
            'csv_whitespace',
            'csv_pipe',
            'rfc_csv',
            'rfc_semicolon'
        }
    }
end)
