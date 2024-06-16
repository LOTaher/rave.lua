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
    return {
        bpm = bpm
    }
end

M.set_distance = function(distance)
    return {
        distance = distance
    }
end

M.set_colors = function(colors)
    local colors_table = {}
    for color in colors:gmatch("[^,]+") do
        table.insert(colors_table, color)
    end
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
    if M.timer then
        M.timer:stop()
    end

    M.timer = vim.loop.new_timer()
    local interval = 60000 / M.config.bpm

    M.timer:start(0, interval, vim.schedule_wrap(function()
        M.recolor_lines()
    end))
end


M.recolor_lines = function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local cursor_line = cursor[1] - 1
    local lines = vim.api.nvim_buf_line_count(0)
    local colors = M.config.colors

    vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_create_namespace("RaveSpace"), 0, -1)

    for i = 0, lines - 1 do
        if math.abs(i - cursor_line) > M.config.distance then
            local color = colors[(i % #colors) + 1]
            local hl_group = "RaveColors" .. (i % #colors + 1)
            vim.api.nvim_set_hl(0, hl_group, { fg = color })
            vim.api.nvim_buf_add_highlight(0, vim.api.nvim_create_namespace("RaveSpace"), hl_group, i, 0, -1)
        end
    end
end

return M
