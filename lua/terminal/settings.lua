local M = {}

local settings = {
  default = "hello"
}

local function is_dict_like (tbl)
    return type(tbl) == 'table' and not vim.tbl_islist(tbl)
end

local function setup(opts, subsettings)
    if opts == nil then
        opts = {}
    end
    for key, value in pairs(opts) do
        if is_dict_like(subsettings[key]) then
            setup(value, subsettings[key])
        else
            subsettings[key] = value
        end
    end
end

M.setup = function(opts)
    setup(opts, settings)
end

M.get = function()
    return settings
end

return M
