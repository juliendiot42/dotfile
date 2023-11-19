if packer_plugins['lsp-zero.nvim'] and packer_plugins['lsp-zero.nvim'].loaded then
  local lsp = require('lsp-zero').preset({})
  lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
  end)


  lsp.ensure_installed({
    'lua_ls',
    'r_language_server',
    -- 'pyright',
  })

  lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
  })

  -- format on save
  lsp.format_on_save({
    servers = {
      ['lua_ls'] = { 'lua' },
      ['r_language_server'] = { 'R' },
      -- ['pyright'] = { 'py' },
    }
  })

  -- config for lua_ls
  local lspconfig = require('lspconfig')
  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            vim.api.nvim_get_runtime_file("", true),
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          },
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  })

  lspconfig.r_language_server.setup({
    settings = {
      R = {
      },
    },
  })
  -- -- config for pyright
  -- lspconfig.pyright.setup({
  --   filetypes = { "python" }
  -- })




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
    formatting = {
      fields = { 'abbr', 'kind', 'menu' },
      format = require('lspkind').cmp_format({
        mode = 'symbol',       -- show only symbol annotations
        maxwidth = 50,         -- prevent the popup from showing more than provided characters
        ellipsis_char = '...', -- the truncated part when popup menu exceed maxwidth
        before = function(entry, item)
          local menu_icon = {
            nvim_lsp = '',
            luasnip = '',
            path = '',
            cmp_zotcite = 'z',
            cmp_nvim_r = 'R'
          }
          item.menu = menu_icon[entry.source.name]
          return item
        end,
      })
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end
    },
    preselect = 'item',
    completion = {
      completeopt = 'menu,menuone,noinsert'
    },
    mapping = {
      -- ['<CR>'] = cmp.mapping.confirm {
      --   select = true
      -- },
      ['<Tab>'] = mySuperTab(),
      ['<S-Tab>'] = myShiftSuperTab()
    },
    sources = {
      { name = 'luasnip',   keyword_length = 2 },
      { name = 'path' },
      { name = 'cmp_nvim_r' },
      { name = 'nvim_lsp',  keyword_length = 3 },
      { name = 'nvim_lua' },
      -- { name = 'buffer',    keyword_length = 3 },
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }
  })


  -- configure snippets
  -- require("luasnip.loaders.from_snipmate").lazy_load({ path = { "~/.config/rstudio/snippets" } }) -- Load snippets from my-snippets folder
  require("luasnip.loaders.from_snipmate").lazy_load({ path = { "./snippets" } }) -- Load snippets from my-snippets folder

  -- use LSP features only if available
  lsp.on_attach(function(client, bufnr)
    local keymapSet = function(keys, func, desc, mod)
      if desc then
        desc = "LSP: " .. desc
      end
      if not mod then
        mod = "n"
      end
      vim.keymap.set(mod, keys, func, { buffer = bufnr, desc = desc })
    end

    -- some keymaps
    keymapSet("gd", function() vim.lsp.buf.definition() end, "[G]o to [D]efinition")
    keymapSet("gr", require('telescope.builtin').lsp_references, "[G]o to [R]eference")
    keymapSet("<leader>ds", require('telescope.builtin').lsp_document_symbols, "[D]ocument [S]ymbols")
    keymapSet("<leader>ws", require('telescope.builtin').lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    keymapSet("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    keymapSet("<leader>ca", function() vim.lsp.buf.code_action() end, "[C]ode [A]ction")
    keymapSet("<leader>vrn", function() vim.lsp.buf.rename() end, "[V]ariable [R]ename")
    keymapSet("K", function() vim.lsp.buf.hover() end, "vim.lsp.buf.hover()")
    keymapSet("<C-h>", function() vim.lsp.buf.signature_help() end, "vim.lsp.buf.hover()", "i")
  end)

  lsp.setup()

  -- I don't really now what it is ... ><
  vim.diagnostic.config({
    virtual_text = true
  })
else
  print("lsp-zero not found")
end
