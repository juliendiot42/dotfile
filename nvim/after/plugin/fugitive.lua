if packer_plugins['vim-fugitive'] and packer_plugins['vim-fugitive'].loaded then
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus (open fugitive)" })
else
    print("vim-fugitive not found")
end
