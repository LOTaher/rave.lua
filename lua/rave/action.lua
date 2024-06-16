local rave = require("rave")

local ns = vim.api.nvim_create_namespace("RaveSpace")

local A = {}

A.timer = nil

A.start_rave = function()
    if A.timer then
        A.timer:stop()
    end

    A.timer = vim.loop.new_timer()
    local interval = 60000 / rave.config.bpm

    A.timer:start(0, interval, vim.schedule_wrap(function()
        A.recolor_lines()
    end))
end

A.stop_rave = function()
    if A.timer then
        A.timer:stop()
        A.timer = nil
    end
end

A.recolor_lines = function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local cursor_line = cursor[1] - 1
    local lines = vim.api.nvim_buf_line_count(0)
    local colors = A.config.colors

    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)

    for i = 0, lines - 1 do
        if math.abs(i - cursor_line) > A.config.distance then
            local color = colors[(i % #colors) + 1]
            local hl_group = "RaveColors" .. (i % #colors + 1)

            vim.api.nvim_set_hl(0, hl_group, { fg = color })

            vim.api.nvim_buf_add_highlight(0, ns, hl_group, i, 0, -1)
        end
    end
end

return A
