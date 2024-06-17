local M = {}

-- utility function to set a timeout
-- @param timeout number time in milliseconds
-- @param callback function Function to execute after the timeout
M.set_timeout = function(timeout, callback)
    local timer = vim.loop.new_timer()
    timer:start(timeout, 0, function()
        vim.schedule(callback)
        timer:stop()
        timer:close()
    end)
    return timer
end

return M
