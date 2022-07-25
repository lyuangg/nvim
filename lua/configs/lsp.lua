-- 安装lsp
require("nvim-lsp-installer").setup {
  automatic_installation = true
}

-- 自动完成
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')


-- on_attach 高亮
local on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_highlight then
        vim.cmd [[
          hi! LspReferenceRead cterm=bold ctermbg=DarkBlue guifg=Dark guibg=Grey
          hi! LspReferenceText cterm=bold ctermbg=DarkBlue guifg=Dark guibg=Grey
          hi! LspReferenceWrite cterm=bold ctermbg=DarkBlue guifg=Dark guibg=Grey
        ]]
        vim.api.nvim_create_augroup('lsp_document_highlight', {})
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          group = 'lsp_document_highlight',
          buffer = 0,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd('CursorMoved', {
          group = 'lsp_document_highlight',
          buffer = 0,
          callback = vim.lsp.buf.clear_references,
        })
    end

end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'gopls', 'pyright', 'tsserver', 'html', 'intelephense', 'eslint', 'jsonls', 'vuels', 'cssls', 'lemminx', 'yamlls', 'emmet_ls'} -- 语言服务
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require 'luasnip'

-- 加载代码片段 friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
     ["<Tab>"] = cmp.mapping(function(fallback)
       if cmp.visible() then
         cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
         luasnip.expand_or_jump()
       elseif has_words_before() then
         cmp.complete()
       else
         fallback()
       end
     end, { "i", "s" }),

     ["<S-Tab>"] = cmp.mapping(function(fallback)
       if cmp.visible() then
         cmp.select_prev_item()
       elseif luasnip.jumpable(-1) then
         luasnip.jump(-1)
       else
         fallback()
       end
     end, { "i", "s" }),

  }),
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
     }, {
      { name = 'buffer'},
      { name = 'path' },
    })
}

-- nvim-cmp for commands
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})


-- 自定义片段
local ls = require"luasnip"
local s = ls.snippet
local t = ls.text_node
ls.add_snippets("go", {
	s("2006", { t("2006-01-02 15:04:05") })
})



