local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
  'lua_ls',
  'r_language_server',
})


-- format on save
lsp.format_on_save({
  servers = {
    ['lua_ls'] = { 'lua' },
    ['r_language_server'] = { 'R' },
  }
})

-- autocomplete config
local luasnip = require 'luasnip'
luasnip.config.setup {}
local cmp = require('cmp')

local mySuperTab = function()
  return cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.confirm({ select = true })
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    else
      cmp.complete()
    end
  end, { 'i', 's' })
end

local myShiftSuperTab = function()
  return cmp.mapping(function(fallback)
    if luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { 'i', 's' })
end

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm {
      select = true
    },
    ['<Tab>'] = mySuperTab(),
    ['<S-Tab>'] = myShiftSuperTab()
  },
  sources = {
    { name = 'path' },
    { name = 'buffer',  keyword_length = 3 },
    { name = 'nvim_lsp' },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'nvim_lua' },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }
})

-- use LSP features only if available
lsp.on_attach(function(client, bufnr)
  local keymapSet = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  -- some keymaps
  keymapSet("gd", function() vim.lsp.buf.definition() end, "[G]o to [D]efinition")
  keymapSet("gr", require('telescope.builtin').lsp_references, "[G]o to [R]eference")
  keymapSet("<leader>ds", require('telescope.builtin').lsp_document_symbols, "[D]ocument [S]ymbols")
  keymapSet("<leader>ws", require('telescope.builtin').lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
  keymapSet("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  keymapSet("<leader>ca", function() vim.lsp.buf.code_action() end, "[C]ode [A]ction")
  keymapSet("K", function() vim.lsp.buf.hover() end, "vim.lsp.buf.hover()")
end)

lsp.setup()

-- I don't really now what it is ... ><
vim.diagnostic.config({
  virtual_text = true
})