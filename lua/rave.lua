local set = require("rave.set")
local action = require("rave.action")

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

local M = {}

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

M.set_bpm = set.set_bpm
M.set_distance = set.set_distance
M.set_colors = set.set_colors
M.start_rave = action.start_rave
M.stop_rave = action.stop_rave
M.recolor_lines = action.recolor_lines

return M
