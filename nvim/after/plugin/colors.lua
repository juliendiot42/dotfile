function ColorMyPencils_rosePine(color)
    if packer_plugins['rose-pine'] and packer_plugins['rose-pine'].loaded then
        -- print("rose")
        -- color = "rose-pine"
        require('rose-pine').setup({
            disable_background = true
        })
        color = color or "rose-pine"
        vim.cmd.colorscheme(color)
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

function ColorMyPencils_catppuccin(color)
    if packer_plugins['catppuccin'] and packer_plugins['catppuccin'].loaded then
        color = "catppuccin"

        require("catppuccin").setup({
            flavour = "frappe", -- latte, frappe, macchiato, mocha
            -- transparent_background = false,
            -- transparent_background = true,
            show_end_of_buffer = false, -- show the '~' characters after the end of buffers
            term_colors = true,
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.3,
                -- transparent_background = true,
            },
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            color_overrides = {},
            custom_highlights = {},
            integrations = {
                treesitter = true,
                markdown = true,
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                telescope = true,
                notify = false,
                mini = false,
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        })
    end

    -- print(color)
    vim.cmd.colorscheme(color)
    -- vim.opt.pumblend = 15
    -- vim.opt.winblend = 15
end

-- ColorMyPencils_rosePine()
ColorMyPencils_catppuccin()
