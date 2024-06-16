local S = {}

S.set_bpm = function(bpm)
    return {
        bpm = bpm
    }
end

S.set_distance = function(distance)
    return {
        distance = distance
    }
end

S.set_colors = function(colors)
    local colors_table = {}
    for color in colors:gmatch("[^,]+") do
        table.insert(colors_table, color)
    end
end

return S
