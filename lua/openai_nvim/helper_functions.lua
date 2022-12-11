
local M = {}


function M.table_to_string(table)
    -- TODO stirp whitespaces
    local text = ""
    for k, v in pairs(table) do
        text = text .. v
    end

    return text
end

function M.string_to_table(str, words_per_line)
    local tbl = {}

    -- Find location of spcaes in str
    local _, n_spaces = str:gsub(" ","") -- Get number of spaces in line
    local spaces = {}
    local pos = 0
    for i = 1, n_spaces, 1 do
        -- print(i)
        pos = string.find(str, "%s", pos+1)
        table.insert(spaces, pos)
    end

    -- Each element in table corresponds to line split
    -- Each element contains words_per_line number of elements
    local start = 0
    for k, val in pairs(spaces) do
        if k % words_per_line == 0 then
            local stop = val
            local line = str:sub(start+1, stop)
            table.insert(tbl, line)
            start = stop
        end
    end
    local line = str:sub(start+1,-1)
    table.insert(tbl, line)

    return tbl
end

return M
