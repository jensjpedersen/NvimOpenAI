local M = {}

function M.print_table(tbl)
    for k, v in pairs(tbl) do
        print(k, v)
    end
end

function M.table_to_string(table)
    -- TODO stirp whitespaces
    local text = ""
    for k, v in pairs(table) do
        text = text .. v
    end

    return text
end

function M.spaces_to_table(str, words_per_line)
    local tbl = {}
    -- Find location of spcaes in str
    local _, n_spaces = str:gsub(" ","") -- Get number of spaces in line
    local indices = {}
    local pos = 0
    for i = 1, n_spaces, 1 do
        pos = string.find(str, "%s", pos+1)
        table.insert(indices, pos)
    end

    -- Each element in table corresponds to line split
    -- Each element contains words_per_line number of elements
    local start = 0
    for k, val in pairs(indices) do
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

function M.line_break_to_table(str)
    local _, n_breaks = str:gsub("\\([n])", "")

    -- print((str:gsub("\\([nt])", {n="\n", t="\t"}))) - convert char tab 

    if n_breaks == 0 then
        return {str}
    end

    local tbl = {} -- table to store the indices
    local i = 0
    for _ = 1, n_breaks, 1 do
        i = string.find(str, "\\([n])", i+1) -- find 'next' newline
        table.insert(tbl, i)
    end

    local lines = {}
    local start = 0
    for _, stop in pairs(tbl) do
        local line = str:sub(start+1, stop-1)
        table.insert(lines, line)
        start = stop
    end

    -- Get last part of str
    local line = str:sub(start+2, -1)
    table.insert(lines, line)

    return lines
end

function M.string_to_table(str, words_per_line)
    local tbl1 = M.line_break_to_table(str)

    local tbl = {}
    for _, s1 in pairs(tbl1) do
        local tbl2 = M.spaces_to_table(s1, words_per_line)
        for _, s2 in pairs(tbl2) do
            table.insert(tbl, s2)
        end
    end

    return tbl

end

-- Write a for loop in Python
return M
