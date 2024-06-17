-- rave.nvim
-- @Author: Laith Taher

local util = require("rave.util")

local M = {}

-- default configuration
M.config = {
    bpm = 120,
    distance = 5,
    colors = {
        "#e81416",
        "#ffa500",
        "#faeb36",
        "#79c314",
        "#487de7",
        "#4b369d",
        "#70369d",
    }
}

-- setup function to configure the plugin
-- @param args table Configuration arguments: {bpm: number, distance: number, colors: {string, string, ...}}
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

-- set the BPM (beats per minute)
-- @param bpm number
M.set_bpm = function(bpm)
    M.config.bpm = bpm
end

-- set the distance for coloring lines
-- @param distance number
M.set_distance = function(distance)
    M.config.distance = distance
end

-- set the colors to cycle through
-- @param colors string A comma-separated string of color codes
-- @example "#FFFFFF,#000000,#FF0000"
M.set_colors = function(colors)
    local colors_table = {}
    for color in colors:gmatch("[^,]+") do
        table.insert(colors_table, color)
    end
    M.config.colors = colors_table
end

local timer_ref

-- start the rave
M.start_rave = function()
    local interval = 60000 / M.config.bpm
    local color_index = 1

    local function rave()
        local bufnr = vim.api.nvim_get_current_buf()
        local line_count = vim.api.nvim_buf_line_count(bufnr)
        local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
        local current_color = M.config.colors[(color_index - 1) % #M.config.colors + 1]

        vim.cmd(string.format("highlight RaveTempHighlight guifg=%s", current_color))

        for i = 1, line_count do
            local distance_from_cursor = math.abs(cursor_line - i)
            if distance_from_cursor <= M.config.distance then
                vim.api.nvim_buf_add_highlight(bufnr, -1, "RaveTempHighlight", i - 1, 0, -1)
            else
                vim.api.nvim_buf_clear_namespace(bufnr, -1, i - 1, i)
            end
        end

        color_index = color_index + 1
        timer_ref = util.setTimeout(interval, rave)
    end

    rave()
end

-- stop the rave
M.stop_rave = function()
    if timer_ref then
        timer_ref:stop()
        timer_ref:close()
        timer_ref = nil
    end

    local bufnr = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_clear_namespace(bufnr, -1, 0, -1)
end

return M
