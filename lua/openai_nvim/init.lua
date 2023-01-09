local ai = require('openai_nvim.openai_request')
local helpers = require('openai_nvim.helper_functions')
local nvim = require('openai_nvim.nvim')
local config = require('openai_nvim.config')




local function send_visual_selection()
    -- main function 1 
    local opts = config.setup()
    local table = nvim.get_visual_selection()
    local prompt = helpers.table_to_string(table)
    assert(opts.api_key ~= nil)
    local answer=ai.api_call(opts.api_key, opts.model, prompt, opts.temperature, opts.max_tokens)
    if answer == nil then return end
    local ans_tbl = helpers.string_to_table(answer, opts.words_per_line)
    nvim.send_to_nvim(ans_tbl, #table-1)
end

local function send_current_line()
    -- main funciton 2 
    local opts = config.setup()
    local prompt = nvim.get_current_line()
    assert(opts.api_key ~= nil)
    local answer=ai.api_call(opts.api_key, opts.model, prompt, opts.temperature, opts.max_tokens)
    if answer == nil then return end
    local ans_tbl = helpers.string_to_table(answer, opts.words_per_line)
    nvim.send_to_nvim(ans_tbl, 0)
end

return {
    send_visual_selection = send_visual_selection,
    send_current_line = send_current_line
}


