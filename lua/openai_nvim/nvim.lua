local M = {}

function M.send_to_nvim(table, rel_pos)
    local buffer = vim.api.nvim_get_current_buf()
    local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_lines(buffer, r+rel_pos, r+rel_pos, false, table)
end

-- This is a test
function M.get_visual_selection()
    -- local cs, ls = unpack(vim.fn.getpos('v'))
    -- local ce, le = unpack(vim.fn.getpos('.'))
    -- local table = vim.api.nvim_buf_get_text(0, ls-1, cs, le, ce, {})

    local cs, ls = unpack(vim.fn.getpos("'<"))
    local ce, le = unpack(vim.fn.getpos("'>"))
    local table = vim.api.nvim_buf_get_lines(0, ls-1, le, {})
    return table
end

function M.get_current_line()
    return vim.api.nvim_get_current_line()
end


return M
