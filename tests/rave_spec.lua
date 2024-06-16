describe("set functions", function()
    it("can be required", function()
        require("rave")
    end)

    it("can change bpm", function()
        local rave = require("rave")
        rave.set_bpm(120)
        assert.equals(120, rave.bpm)
    end)

    it("can change distance", function()
        local rave = require("rave")
        rave.set_distance(5)
        assert.equals(5, rave.distance)
    end)

    it("can change colors", function()
        local rave = require("rave")
        rave.set_colors("#FF0000,#00FF00,#0000FF,#FFFF00,#FF00FF,#00FFFF,#FFFFFF,#000000")
        assert.same({
            "#FF0000",
            "#00FF00",
            "#0000FF",
            "#FFFF00",
            "#FF00FF",
            "#00FFFF",
            "#FFFFFF",
            "#000000",
        }, rave.colors)
    end)
end)

describe("setup function", function()
    it("can change setup bpm", function()
        local rave = require("rave")
        rave.setup({ bpm = 120 })
        assert.equals(120, rave.config.bpm)
    end)

    it("can change setup distance", function()
        local rave = require("rave")
        rave.setup({ distance = 5 })
        assert.equals(5, rave.config.distance)
    end)

    it("can change setup colors", function()
        local rave = require("rave")
        rave.setup({
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
        })
        assert.same({
            "#FF0000",
            "#00FF00",
            "#0000FF",
            "#FFFF00",
            "#FF00FF",
            "#00FFFF",
            "#FFFFFF",
            "#000000",
        }, rave.config.colors)
    end)
end)

-- describe("start_rave function", function()
    -- TODO: test if it starts
    -- TODO: test color switching
-- end)

-- describe("stop_rave function", function()
    -- TODO: test if it stops
    -- end)
