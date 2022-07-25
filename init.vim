" 基本配置, 快捷键
so ~/.config/nvim/basic.vim

" lua 插件
lua require('plugins')

" lua 插件配置
lua require("impatient")
lua require("configs.lsp")
lua require("configs.statusline").config()
lua require("configs.bufferline").config()
lua require("configs.filetree").config()
lua require("configs.outlinetree").config()
lua require("configs.treesitter").config()
lua require("configs.comment").config()
lua require("configs.git").config()

" lua 插件快捷键
lua require('keymaps')

" 主题
set background=dark
colorscheme gruvbox

