if packer_plugins['undotree'] and packer_plugins['undotree'].loaded then
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndo tree" })
else
    print("undotree not found")
end
