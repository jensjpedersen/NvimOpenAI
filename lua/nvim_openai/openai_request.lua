




local M = {}

function M.api_call(api_key, model, prompt)
    local command=string.format([[
        curl -s https://api.openai.com/v1/completions \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer %s" \
        -d '{"model": "%s", "prompt": "%s", "temperature": 0, "max_tokens": 100}'
        ]], api_key, model, prompt)

    local output = io.popen(command)
    local output = output:read('*a')

    -- start, stop, match = string.find(output, '"text":(.+)","index"')
    start, stop, match = string.find(output, [["text":"\n\n(.+)","index"]])

    return match

end


return M
