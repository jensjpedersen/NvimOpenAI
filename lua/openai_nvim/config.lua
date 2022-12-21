
local M = {}

function M.setup()
    local opts = {}
    opts.api_key = vim.g.openai_settings.api_key or os.getenv('OPENAI_API_KEY')
    opts.model = vim.g.openai_settings.model or "text-davinci-002"
    opts.temperature = vim.g.openai_settings.temperature or 0.5
    opts.max_tokens = vim.g.openai_settings.max_tokens or 2048
    opts.words_per_line = vim.g.openai_settings.words_per_line or 15
    return opts
end


return M

