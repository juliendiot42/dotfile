if packer_plugins['Nvim-R'] and packer_plugins['Nvim-R'].loaded then
    local R_filetypes = { 'r', 'rmd', 'rrst', 'rnoweb', 'quarto', 'rhelp' }
    vim.g.R_auto_start = 0
    -- vim.g.R_filetypes = R_filetypes
    vim.g.R_assign = 2
    vim.g.R_min_editor_width = 1
    vim.g.R_rconsole_width = 80
    vim.g.R_objbr_place = "console,below"
    vim.g.R_objbr_place = 'LEFT'
    vim.g.R_set_omnifunc = {}
    vim.g.R_user_maps_only = 1

    local function setCustomNvimRMappings()
        local keymapSet = function(keys, func, desc, mod)
            if desc then
                desc = "nvim-R: " .. desc
            end
            if not mod then
                mod = "n"
            end
            nvim_buf_set_keymap(0, mod, keys, func, { buffer = bufnr, desc = desc })
        end
        keymapSet("<leader>t", ":call StartR(\"R\")<CR>", { desc = "Start R" }, "n")
    end

    local myNvimR = vim.api.nvim_create_augroup("myNvimR", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        pattern = R_filetypes,
        callback = setCustomNvimRMappings,
        group = myNvimR
    })
end




-- else
--     print("Nvim-R not found.")
-- end

-- function! s:customNvimRMappings()
--    nmap <buffer> <Leader>sr <Plug>RStart
--    imap <buffer> <Leader>sr <Plug>RStart
--    vmap <buffer> <Leader>sr <Plug>RStart
-- endfunction

-- augroup myNvimR
--    au!
--    autocmd filetype r call s:customNvimRMappings()
-- augroup end


-- v  \rd         *@<Esc>:call RSetWD()<CR>
-- v  \ko         *@<Esc>:call RMakeRmd("odt_document")<CR>
-- v  \kh         *@<Esc>:call RMakeRmd("html_document")<CR>
-- v  \kw         *@<Esc>:call RMakeRmd("word_document")<CR>
-- v  \kl         *@<Esc>:call RMakeRmd("beamer_presentation")<CR>
-- v  \kp         *@<Esc>:call RMakeRmd("pdf_document")<CR>
-- v  \ka         *@<Esc>:call RMakeRmd("all")<CR>
-- v  \kr         *@<Esc>:call RMakeRmd("default")<CR>
-- v  \r-         *@<Esc>:call RBrOpenCloseLs("C")<CR>
-- v  \r=         *@<Esc>:call RBrOpenCloseLs("O")<CR>
-- v  \ro         *@<Esc>:call RObjBrowser()<CR>
-- v  \rb         *@<Esc>:call RAction("plotsumm", "v")<CR>
-- v  \rg         *@<Esc>:call RAction("plot", "v")<CR>
-- v  \rs         *@<Esc>:call RAction("summary", "v")<CR>
-- v  \rh         *@<Esc>:call RAction("help")<CR>
-- v  \re         *@<Esc>:call RAction("example")<CR>
-- v  \ra         *@<Esc>:call RAction("args")<CR>
-- v  \td         *@<Esc>:call RAction("dputtab", "v")<CR>
-- v  \vh         *@<Esc>:call RAction("viewobj", "v", ", howto='above 7split', nrows=6")<CR>
-- v  \vv         *@<Esc>:call RAction("viewobj", "v", ", howto='vsplit'")<CR>
-- v  \vs         *@<Esc>:call RAction("viewobj", "v", ", howto='split'")<CR>
-- v  \rv         *@<Esc>:call RAction("viewobj", "v")<CR>
-- v  \rt         *@<Esc>:call RAction("str", "v")<CR>
-- v  \rn         *@<Esc>:call RAction("nvim.names", "v")<CR>
-- v  \rp         *@<Esc>:call RAction("print", "v")<CR>
-- v  \rm         *@<Esc>:call RClearAll()<CR>
-- v  \rr         *@<Esc>:call RClearConsole()<CR>
-- v  \rl         *@<Esc>:call g:SendCmdToR("ls()")<CR>
-- v  \o          *@<Esc>:call RWarningMsg("This command does not work over a selection of lines.")<CR>
-- v  \sa         *@<Esc>:call SendSelectionToR("echo", "down")<CR>
-- v  \sd         *@<Esc>:call SendSelectionToR("silent", "down")<CR>
-- v  \se         *@<Esc>:call SendSelectionToR("echo", "stay")<CR>
-- v  \ss         *@<Esc>:call SendSelectionToR("silent", "stay")<CR>
-- v  \fa         *@<Esc>:call SendFunctionToR("echo", "down")<CR>
-- v  \fd         *@<Esc>:call SendFunctionToR("silent", "down")<CR>
-- v  \fe         *@<Esc>:call SendFunctionToR("echo", "stay")<CR>
-- v  \ff         *@<Esc>:call SendFunctionToR("silent", "stay")<CR>
-- v  \rw         *@<Esc>:call RQuit('save')<CR>
-- v  \rq         *@<Esc>:call RQuit('nosave')<CR>
-- v  \rc         *@<Esc>:call StartR("custom")<CR>
-- v  \rf         *@<Esc>:call StartR("R")<CR>
-- no \rd         *@:call RSetWD()<CR>
-- no \ko         *@:call RMakeRmd("odt_document")<CR>
-- no \kh         *@:call RMakeRmd("html_document")<CR>
-- no \kw         *@:call RMakeRmd("word_document")<CR>
-- no \kl         *@:call RMakeRmd("beamer_presentation")<CR>
-- no \kp         *@:call RMakeRmd("pdf_document")<CR>
-- no \ka         *@:call RMakeRmd("all")<CR>
-- no \kr         *@:call RMakeRmd("default")<CR>
-- no \r-         *@:call RBrOpenCloseLs("C")<CR>
-- no \r=         *@:call RBrOpenCloseLs("O")<CR>
-- no \ro         *@:call RObjBrowser()<CR>
-- no \rb         *@:call RAction("plotsumm")<CR>
-- no \rg         *@:call RAction("plot")<CR>
-- no \rs         *@:call RAction("summary")<CR>
-- no \rh         *@:call RAction("help")<CR>
-- no \re         *@:call RAction("example")<CR>
-- no \ra         *@:call RAction("args")<CR>
-- no \td         *@:call RAction("dputtab")<CR>
-- no \vh         *@:call RAction("viewobj", ", howto='above 7split', nrows=6")<CR>
-- no \vv         *@:call RAction("viewobj", ", howto='vsplit'")<CR>
-- no \vs         *@:call RAction("viewobj", ", howto='split'")<CR>
-- no \rv         *@:call RAction("viewobj")<CR>
-- no \rt         *@:call RAction("str")<CR>
-- no \rn         *@:call RAction("nvim.names")<CR>
-- no \rp         *@:call RAction("print")<CR>
-- no \rm         *@:call RClearAll()<CR>
-- no \rr         *@:call RClearConsole()<CR>
-- no \rl         *@:call g:SendCmdToR("ls()")<CR>
-- \ud         *@:call RAction("undebug")<CR>
-- \bg         *@:call RAction("debug")<CR>
-- \su         *@:call SendAboveLinesToR()<CR>
-- \r<Right>   *@:call RSendPartOfLine("right", 0)<CR>
-- \r<Left>    *@:call RSendPartOfLine("left", 0)<CR>
-- \m          *@:set opfunc=SendMotionToR<CR>g@
-- no \o          *@:call SendLineToRAndInsertOutput()<CR>0
-- \d          *@:call SendLineToR("down")<CR>0
-- \l          *@:call SendLineToR("stay")<CR>
-- \pa         *@:call SendParagraphToR("echo", "down")<CR>
-- \pd         *@:call SendParagraphToR("silent", "down")<CR>
-- \pe         *@:call SendParagraphToR("echo", "stay")<CR>
-- \pp         *@:call SendParagraphToR("silent", "stay")<CR>
-- v  \so         *@<Esc>:call SendSelectionToR("echo", "stay", "NewtabInsert")<CR>
-- no \sa         *@:call SendSelectionToR("echo", "down", "normal")<CR>
-- no \sd         *@:call SendSelectionToR("silent", "down", "normal")<CR>
-- no \se         *@:call SendSelectionToR("echo", "stay", "normal")<CR>
-- no \ss         *@:call SendSelectionToR("silent", "stay", "normal")<CR>
-- no \fa         *@:call SendFunctionToR("echo", "down")<CR>
-- no \fd         *@:call SendFunctionToR("silent", "down")<CR>
-- no \fe         *@:call SendFunctionToR("echo", "stay")<CR>
-- no \ff         *@:call SendFunctionToR("silent", "stay")<CR>
-- \ba         *@:call SendMBlockToR("echo", "down")<CR>
-- \bd         *@:call SendMBlockToR("silent", "down")<CR>
-- \be         *@:call SendMBlockToR("echo", "stay")<CR>
-- \bb         *@:call SendMBlockToR("silent", "stay")<CR>
-- \ks         *@:call RSpin()<CR>
-- \ao         *@:call ShowRout()<CR>
-- \ae         *@:call SendFileToR("echo")<CR>
-- \aa         *@:call SendFileToR("silent")<CR>
-- no \rw         *@:call RQuit('save')<CR>
-- no \rq         *@:call RQuit('nosave')<CR>
-- no \rc         *@:call StartR("custom")<CR>
-- no \rf         *@:call StartR("R")<CR>
