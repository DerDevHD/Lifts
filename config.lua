Config = {}

Config.Locale = 'en'

Config.AllowSounds = true

Config.MarkerSize = 0.65
Config.MarkerColor = {
    R = 0,
    B = 195,
    G = 255,
    A = 204 -- to convert from range (0,1) to (0,255), simply multiply by 255
}
Config.Lifts = {}

--[[
    from bottom to top (floor)
    Config.Lifts = {
        {vector3 - floor1, vector3 - floor2, ... - floorN}, - lift1
        {vector3, vector3, vector3, ...}, - lift2
        ...,
    }
]]--