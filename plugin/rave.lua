-- rave.nvim
-- Author: Laith Taher

-- Create a user command "Rave" to control the plugin
-- Usage: :Rave <subcommand> <value>
-- Subcommands:
--   bpm <number>: Set the BPM (beats per minute)
--   distance <number>: Set the distance for line coloring
--   colors <comma-separated string>: Set the colors to cycle through
--   start: Start the rave effect
--   stop: Stop the rave effect
vim.api.nvim_create_user_command("Rave", function(params)
    local subcommand = params.fargs[1]
    local value = params.fargs[2]

    if subcommand == "bpm" and tonumber(value) then
        require("rave").set_bpm(tonumber(value))
    elseif subcommand == "distance" and tonumber(value) then
        require("rave").set_distance(tonumber(value))
    elseif subcommand == "colors" then
        local colors = vim.split(value, ",")
        require("rave").set_colors(colors)
    elseif subcommand == "start" then
        require("rave").start_rave()
    elseif subcommand == "stop" then
        require("rave").stop_rave()
    else
        print("Invalid command or value")
    end
end, { nargs = "*" })
