local M = require('openai_request')
local helpers = require('helper_functions')


local setup = {
    -- Replace `<YOUR-API-KEY>` with your actual API key
    api_key = os.getenv('OPENAI_API_KEY'),
    -- Set up the request parameters
    model = "text-davinci-002"
}

local function send_to_nvim(table)
    local buffer = vim.api.nvim_get_current_buf()
    local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_lines(buffer, r, r, false, table)
end

local function get_visual_selection()
    local cs, ls = unpack(vim.fn.getpos('v'))
    local ce, le = unpack(vim.fn.getpos('.'))
    local table = vim.api.nvim_buf_get_text(0, ls-1, cs, le, ce, {})
    -- Sort if le < ls
    return table
end

local function get_current_line()
    return vim.api.nvim_get_current_line()
end


local function send_visual_selection()
    -- mian function 1 
    local table = get_visual_selection()
    local text = helpers.table_to_string(table)
    local answer=M.api_call(setup.api_key, setup.model, "What is an Ai?")
    send_to_nvim({answer})
end

local function send_current_line()
    -- main funciton 2 
    local prompt = get_current_line()
    print(prompt)
    assert(setup.api_key ~= nil)
    local answer=M.gpt3_api_call(setup.api_key, prompt)
    print(answer)
    local ans_tbl = helpers.string_to_table(answer, 10)
    send_to_nvim(ans_tbl)
end


-- dev: Set keymaps 
local opts = { noremap=true, silent=true }
vim.keymap.set('v', '<leader>a', send_visual_selection, opts)
vim.keymap.set('n', '<leader>a', send_current_line, opts)

return {
    send_current_line = send_current_line
}



