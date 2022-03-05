Config = {}

Config.Locale = 'en'

Config.AllowSounds = true

Config.Lifts = {{
        vector3(135.45, -763.8, 45.8),
        vector3(135.45, -763.8, 234.2)
    },{
        vector3(460.6, -990.9, 30.7),
        vector3(473.1, -1003.7, 41)
    },{
        vector3(-2359.9, 3251.2, 32.8),
        vector3(-2360, 3251.1, 92.9)
    },{
        vector3(-620.9, -224.7, 38.1),
        vector3(-591.3, -282.9, 50.3),
        vector3(-602.7, -263.9, 52.3)
    }
}

--[[
    from bottom to top (floor)
    Config.Lifts = {
        {vector3 - floor1, vector3 - floor2, ... - floorN}, - lift1
        {vector3, vector3, vector3, ...}, - lift2
        ...,
    }
]]--