if packer_plugins['telescope.nvim'] and packer_plugins['telescope.nvim'].loaded then
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind [F]ile" })
    vim.keymap.set('n', '<leader>fgf', builtin.git_files, { desc = "[F]ind [G]it [F]iles" })
    vim.keymap.set('n', '<leader>f*', builtin.grep_string, { desc = "[F]ind word under the cursor" })
    vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "[F]ind [W]ords, `grep in all project files`" })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "[F]ind [Diagnostics]" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "[F]ind [H]elp" })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "[F]ind [K]ekmaps" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[F]ind [B]uffers" })
    vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "[F]ind [C]ommands" })
    vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = "[F]ind [M]arks" })
end
