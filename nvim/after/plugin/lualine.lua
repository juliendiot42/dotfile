if packer_plugins['lualine.nvim'] and packer_plugins['lualine.nvim'].loaded then
    require('lualine').setup {
        options = {
            icons_enabled = true,
            -- theme = 'auto',
            theme = 'catppuccin',
            -- component_separators = { left = '', right = ''},
            component_separators = '|',
            -- section_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            -- section_separators = '',
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },

        sections = {
            lualine_a = {{ 'mode' , fmt = function(str) return " "..str end}},
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = {
                {
                    'filename',
                    path = 1,                        -- relative path
                    symbols = {
                        modified = '*',              -- Text to show when the file is modified.
                        readonly = '-- readOnly --', -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '-- No Name --',   -- Text to show for unnamed buffers.
                        newfile = '-- New --',       -- Text to show for newly created file before first write
                    },
                }
            },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },

        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
else
    print("lualine not found")
end
