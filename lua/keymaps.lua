
-- f: file tree
vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<cr>')


-- buffers
vim.keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<cr>')
vim.keymap.set('n', '<leader>2', ':BufferLineGoToBuffer 2<cr>')
vim.keymap.set('n', '<leader>3', ':BufferLineGoToBuffer 3<cr>')
vim.keymap.set('n', '<leader>4', ':BufferLineGoToBuffer 4<cr>')
vim.keymap.set('n', '<leader>5', ':BufferLineGoToBuffer 5<cr>')
vim.keymap.set('n', '<leader>6', ':BufferLineGoToBuffer 6<cr>')
vim.keymap.set('n', '<leader>7', ':BufferLineGoToBuffer 7<cr>')
vim.keymap.set('n', '<leader>8', ':BufferLineGoToBuffer 8<cr>')
vim.keymap.set('n', '<leader>9', ':BufferLineGoToBuffer 9<cr>')

-- outline
vim.keymap.set('n', '<leader>o', ':SymbolsOutline<cr>')

-- telescope
vim.keymap.set('n', '<leader>f', function() require'telescope.builtin'.find_files{} end)
vim.keymap.set('n', '<leader>bo', function() require'telescope.builtin'.buffers{} end)
-- vim.keymap.set({'n', 'i'}, '<C-p>', function() require'telescope.builtin'.registers{} end)

-- startify
vim.keymap.set('n', '<leader>n', ':Startify<cr>')

-- lsp 快捷键
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting)
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)

-- substitute
vim.keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
