local MessageTable
local Timeout
local LiftList
local IndexList
local Size, Color
local Ped
local UseLift = function(lift, direction)
    local targetPos
    if direction > 0 then
        targetPos = Config.Lifts[lift[1]][lift[2] + 1]
    else
        targetPos = Config.Lifts[lift[1]][lift[2] - 1]
    end
    if Config.AllowSounds then
        PlaySound(-1, "Hit_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true)
    end
    DoScreenFadeOut(800)
    while not IsScreenFadedOut() do
        Wait(10)
    end
    SetEntityCoords(Ped, targetPos.x, targetPos.y, targetPos.z - 0.75, false, false, false, false)
    Wait(250)
    Timeout = 0
    DoScreenFadeIn(800)
end
local DisplayHelp = function(text, silent)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, 0, not silent, 2000)
end

if not Config.Locale or Config.Locale == '' or not Locale[string.upper(Config.Locale)] then
    MessageTable = Locale['EN']
else
    MessageTable = Locale[string.upper(Config.Locale)]
end
Timeout = 0
LiftList = {}
IndexList = {}
if #Config.Lifts > 0 then
    for i, lift in ipairs(Config.Lifts) do
        for j, pos in ipairs(lift) do
            table.insert(LiftList, pos)
            table.insert(IndexList, {i, j})
        end
    end
end
Size, Color = Config.MarkerSize, Config.MarkerColor

-- main loop
CreateThread(function()
    if #LiftList == 0 then
        return
    end
    while true do
        Wait(1)
        Ped = PlayerPedId()

        local playerCoords = GetEntityCoords(Ped)
        local distance
        local originalIndex
        for i, pos in pairs(LiftList) do
            distance = #(pos - playerCoords)
            if distance <= 30 then
                DrawMarker(20, pos.x, pos.y, pos.z - 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Size, Size, Size, Color.R, Color.G, Color.B, Color.A, false, true, 2, nil, nil, false)
            end
            if distance <= 0.8 then
                if Timeout == 0 then
                    DisplayHelp(MessageTable.usage)
                end
                originalIndex = IndexList[i]
                if IsControlJustReleased(0, 172) then -- UP
                    if originalIndex[2] == #(Config.Lifts[originalIndex[1]]) then
                        if Config.AllowSounds then
                            PlaySound(-1, "Error", "GTAO_Exec_SecuroServ_Warehouse_PC_Sounds", true)
                        end
                        if Timeout == 0 then
                            Timeout = 2
                            DisplayHelp(MessageTable.topfloor, true)
                        end
                    else
                        UseLift(originalIndex, 1)
                    end
                end
                if IsControlJustReleased(0, 173) then -- DOWN
                    if originalIndex[2] == 1 then
                        if Config.AllowSounds then
                            PlaySound(-1, "Error", "GTAO_Exec_SecuroServ_Warehouse_PC_Sounds", true)
                        end
                        if Timeout == 0 then
                            Timeout = 2
                            DisplayHelp(MessageTable.bottomfloor, true)
                        end
                    else
                        UseLift(originalIndex, 0)
                    end
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        if Timeout > 0 then
            Timeout = Timeout - 1
        end
        Wait(1000)
    end
end)