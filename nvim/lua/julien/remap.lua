-- set leader key
vim.g.mapleader = " "


-- for wrapped line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "[F]ile [E]xplorer `:Ex`" })


vim.keymap.set("i", "<Down>", "<C-o>gj")
vim.keymap.set("i", "<Up>", "<C-o>gk")

-- don't yank with 'c' (yank in the 'c' register)
vim.keymap.set("n", "c", "\"cc")
vim.keymap.set("v", "c", "\"cc")


function PasteWithoutYank()
  -- The idea is to yank in the void register,
  -- "_dP
  -- the problem is that if the seleciton is until the end of the line
  -- the cursor will be on the last character of the line and therfore
  -- p should be used instead of P

  local selection_end = vim.fn.getpos("'>")
  local selection_end_line = selection_end[2]
  local selection_end_col = selection_end[3] - 1
  local line_content = vim.api.nvim_buf_get_lines(
    vim.api.nvim_get_current_buf(),
    selection_end_line - 1,
    selection_end_line,
    false)[1]
  local line_width = vim.fn.strdisplaywidth(line_content)

  if selection_end_col == line_width then
    vim.api.nvim_feedkeys("\"_dp", 'n', true)
  else
    vim.api.nvim_feedkeys("\"_dP", 'n', true)
  end
end

vim.keymap.set("v", "<leader>p", "p", { desc = "normal [P]aste over (yank text)" })
-- vim.keymap.set("v", "p", "\"_dP", { desc = "[P]aste over without yanking" })
vim.keymap.set("v", "p", [[<Cmd>lua PasteWithoutYank()<CR>]],
  { desc = "[P]aste over without yanking" })

-- move selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines Up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines Down" })

-- add new lines with Ctrl-j/k
-- vim.keymap.set("n", "<C-j>", "o<ESC>", { desc = "Add new line above" })
-- vim.keymap.set("n", "<C-k>", "O<ESC>", { desc = "Add new line below" })

-- insert space from normal mode
-- vim.keymap.set("n", "<C-Space>", "i<Space><ESC>l", { desc = "Insert space" })


-- Map Ctrl-Backspace to delete the previous word in insert mode.
-- not working: vim.keymap.set("i", "<C-BS>", "<C-w>")


-- Search selected text
vim.keymap.set("v", "*", "y/<C-R>\"<CR>")
vim.keymap.set("n", "<leader>hl", ":set hlsearch!<CR>", { desc = "Tollge [h]igh[l]ight search" })

-- better "movement" behaviour
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "{", "10k")
vim.keymap.set("n", "}", "10j")
-- vim.keymap.set("n", "{", "{")
-- vim.keymap.set("n", "}", "}")

-- insert <- with `Alt+-` (for R)
vim.keymap.set("i", "<M-->", "<-") -- no need to go in "Ex" mode

-- other
vim.keymap.set("n", "Q", "<nop>") -- no need to go in "Ex" mode
