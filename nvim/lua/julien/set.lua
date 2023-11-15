-- line number
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.ruler = true

-- tab behavior
vim.opt.tabstop = 4        -- tab lenght
vim.opt.softtabstop = 4    --
vim.opt.shiftwidth = 4     -- 4 space when indenting with `>`
vim.opt.expandtab = true   -- insert space rather than tab
vim.opt.breakindent = true -- indent break lines

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "Makefile" },
    callback = function()
        vim.opt_local.expandtab = false
    end
})



-- save
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.autoread = true     -- relaod file when changed from outsid
vim.opt.autowriteall = true -- auto save on exit an other
vim.cmd [[
  augroup AutoSaveOnFocusLost
    autocmd!
    autocmd FocusLost * silent! wa
  augroup END
]]
vim.api.nvim_create_user_command('W', 'w', { desc = "Same as `w`" })

-- remove trailing spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = function()
        if vim.bo.filetype == "markdown" then
            vim.cmd [[%s/\(\s\)\{3,\}$/  /e]]
            return
        end
        vim.cmd [[%s/\s\+$//e]]
    end
})

-- vim.opt.listchars = {tab = ">-"}
vim.opt.list = true

-- search behavior
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- editor
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80,95" -- highlight the 80th column
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.splitbelow = true -- split windows down
vim.opt.splitright = true -- split windows right
vim.opt.virtualedit = "onemore"
-- copy
vim.opt.clipboard = "unnamedplus" -- use clipboard by default
vim.opt.selection = "exclusive"   -- `v$` do not include the line break

-- highlight on yank:
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
