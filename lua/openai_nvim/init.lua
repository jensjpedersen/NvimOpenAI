local M = require('openai_nvim.openai_request')
local helpers = require('openai_nvim.helper_functions')


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

    print(cs, ls)
    print(ce, le)
    -- local table = vim.api.nvim_buf_get_text(0, ls-1, cs, le, ce, {})
    -- -- Sort if le < ls
    -- return table
end

local function get_current_line()
    return vim.api.nvim_get_current_line()
end


local function send_visual_selection()
    -- mian function 1 
    local table = get_visual_selection()

    for k, v in pairs(table) do print(k, v) end


    -- local prompt = helpers.table_to_string(table)

    -- local answer=M.gpt3_api_call(setup.api_key, prompt)
    -- local ans_tbl = helpers.string_to_table(answer, 10)
    -- send_to_nvim(ans_tbl)
end

-- Say somthing

local function send_current_line()
    -- main funciton 2 
    local prompt = get_current_line()
    assert(setup.api_key ~= nil)
    local answer=M.gpt3_api_call(setup.api_key, prompt)
    local ans_tbl = helpers.string_to_table(answer, 10)
    send_to_nvim(ans_tbl)
end

-- what is an AI?

return {
    send_current_line = send_current_line,
    send_visual_selection = send_visual_selection
}



