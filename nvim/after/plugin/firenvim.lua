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
                takeover = "never",
                filename = vim.env.HOME .. '/.firenvimfiles/{hostname%32}_{pathname%32}_{selector%32}_{timestamp%32}.md'
            },
            ["gitlab.com"] = {
                takeover = "always",
            },
        }
    }

    if vim.g.started_by_firenvim == true then
        vim.o.laststatus = 0
        -- vim.o.guifont = "FiraCode Nerd Font:h16"
        vim.api.nvim_create_autocmd("UIEnter", {
            callback = function()
                vim.o.guifont = "FiraCode Nerd Font:h16"
                vim.fn.timer_start(200, function()
                    if vim.o.lines < 15 then
                        vim.o.lines = 15
                    end
                end)
            end,
        })

        -- vim.api.nvim_create_autocmd({ 'BufEnter' }, {
        --     pattern = "gitlab.com_*.txt",
        --     command = "set filetype=markdown",
        -- })
        -- vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
        --     nested = true,
        --     command = "write"
        -- })
    else
        vim.o.laststatus = 2
    end
end
