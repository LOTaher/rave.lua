local M = {}

local default_config = {
    bpm = 120,
    distance = 5,
    colors = {
        "#FF0000",
        "#00FF00",
        "#0000FF",
        "#FFFF00",
        "#FF00FF",
        "#00FFFF",
        "#FFFFFF",
        "#000000",
    }
}


M.config = default_config

M.setup = function(args)
    if args then
        if args.bpm then
            M.config.bpm = args.bpm
        end
        if args.distance then
            M.config.distance = args.distance
        end
        if args.colors then
            M.config.colors = args.colors
        end
    end
end

-- Set functions
M.set_bpm = function(bpm)
    M.bpm = bpm
end

M.set_distance = function(distance)
    M.distance = distance
end

M.set_colors = function(colors)
    local colors_table = {}
    for color in colors:gmatch("[^,]+") do
        table.insert(colors_table, color)
    end
    M.colors = colors_table
end


-- Action functions
M.timer = nil

M.stop_rave = function()
    if M.timer then
        M.timer:stop()
        M.timer = nil
    end
end

M.start_rave = function()
    -- TODO:
end

M.recolor_lines = function()
    -- TODO:
end

return M
