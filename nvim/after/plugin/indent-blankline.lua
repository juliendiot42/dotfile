if packer_plugins['indent-blankline.nvim'] and packer_plugins['indent-blankline.nvim'].loaded then
    vim.opt.list = true
    vim.opt.listchars:append "space:⋅"
    vim.opt.listchars:append "eol:↴"

    if packer_plugins['indent_blankline.nvim'] and packer_plugins['indent_blankline.nvim'].loaded then
        require("indent_blankline").setup {
            show_end_of_line = true,
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true,
        }
    end
else
    print("indent-blankline not found")
end
