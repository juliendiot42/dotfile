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
        tag = '0.1.1',
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
        }
    })

    -- navigate between files
    use({
        'ThePrimeagen/harpoon',
        require = { { 'nvim-lua/plenary.nvim' } }
    })

    -- colorscheme (cf. `after/plugin/colors.lua`)
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        cond = notInVScode,
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    })

    -- use ({
    --     'rose-pine/neovim',
    --     as = "rose-pine",
    --     cond = notInVScode,
    --     config = function()
    --         vim.cmd('colorscheme rose-pine')
    --     end
    -- })

    -- use ({
    --         'navarasu/onedark.nvim',
    --         as = "onedark",
    --         config = function()
    --       	  vim.cmd('colorscheme onedark')
    --         end
    -- })


    -- Status line (see `:help lualine.txt`)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- (cf. `after/plugin/treesitter.lua`)
    use({
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' },
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
end)
