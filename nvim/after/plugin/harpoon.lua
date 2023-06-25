if packer_plugins['harpoon.nvim'] and packer_plugins['harpoon.nvim'].loaded then
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>h", mark.add_file, { desc = "[H]rpoon current file" })
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle Harpoon UI ([E]xplore open files)" })

    vim.keymap.set("n", "<C-j>", function() ui.nav_next() end, { desc = "Go to next harpooned file" })
    vim.keymap.set("n", "<C-k>", function() ui.nav_prev() end, { desc = "Go to prev harpooned file" })
end
