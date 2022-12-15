local ai = require('openai_nvim.openai_request')
local helpers = require('openai_nvim.helper_functions')
local nvim = require('openai_nvim.nvim')

local setup = {
    -- Replace `<YOUR-API-KEY>` with your actual API key
    api_key = os.getenv('OPENAI_API_KEY'),
    -- Set up the request parameters
    model = "text-davinci-002"
}


local function send_visual_selection()
    -- main function 1 
    local table = nvim.get_visual_selection()
    local prompt = helpers.table_to_string(table)
    assert(setup.api_key ~= nil)
    local answer=ai.gpt3_api_call(setup.api_key, prompt)
    if answer == nil then return end
    local ans_tbl = helpers.string_to_table(answer, 10)
    nvim.send_to_nvim(ans_tbl)
end


local function send_current_line()
    -- main funciton 2 
    local prompt = nvim.get_current_line()
    assert(setup.api_key ~= nil)
    local answer=ai.gpt3_api_call(setup.api_key, prompt)
    if answer == nil then return end
    local ans_tbl = helpers.string_to_table(answer, 10)
    nvim.send_to_nvim(ans_tbl)
end

return {
    send_current_line = send_current_line,
    send_visual_selection = send_visual_selection,
    setup = setup
}



