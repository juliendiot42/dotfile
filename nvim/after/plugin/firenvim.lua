if packer_plugins['firenvim'] and packer_plugins['firenvim'].loaded then
    vim.g.firenvim_config = {
        globalSettings = { alt = "all" },
        localSettings = {
            [".*"] = {
                cmdline  = "neovim",
                -- cmdline  = "firevim",
                content  = "text",
                priority = 0,
                selector = "textarea",
                takeover = "always"
            }
        }
    }

    if vim.g.started_by_firenvim == true then
        vim.o.laststatus = 0

        vim.api.nvim_create_autocmd("UIEnter", {
            callback = function()
                vim.opt.lines = 15
            end,
        })

        vim.api.nvim_create_autocmd({ 'BufEnter' }, {
            pattern = "gitlab.com_*.txt",
            command = "set filetype=markdown"
        })
    else
        vim.o.laststatus = 2
    end
end
