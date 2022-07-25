local M = {}
function M.config()
	require 'nvim_comment'.setup {
        marker_padding = true, -- 空格
        comment_empty = false, -- 空行
        line_mapping = "<leader>c", 
        operator_mapping = "<leader>/",
    }
end

return M
