-- Declaring Vars
local Zones = {"Range Trigger Zone"}

BerthAPI = {
    -- Broadcast a message to everyone on the mission
    BroadcastMessageAll = function(message, duration)
        trigger.action.outText(message, duration)
    end,

    -- Calls whenever a unit enters a trigger zone
    SetupTrigUnitEntersZone = function(zoneName)
        local zone = trigger.misc.getZone(zoneName)
        local zonePos = zone.point
        local zoneRadius = zone.radius
    end
}

-- INIT
TriggerZonesHandler = function()
    local players = coalition.getPlayers(coalition.side.BLUE) -- Returns Array of Unit Class (https://wiki.hoggitworld.com/view/DCS_Class_Unit)

    for i = 1, #Zones do
        BerthAPI.BroadcastMessageAll("Checking " .. Zones[i], 5)
        local zone = trigger.misc.getZone(Zones[i])
        local zonePos = zone.point
        local zoneRadius = zone.radius

        if #players > 0 then
            -- Checking if a player is in trigger zone
            for u = 1, #players do
                local playerPos = players[u]:getPoint()
                local playerDistance = (((playerPos.x - zonePos.x) ^ 2) + (((playerPos.z - zonePos.z) ^ 2))) ^ 0.5

                if (playerDistance <= zoneRadius) and (playerDistance >= -zoneRadius) then
                    BerthAPI.BroadcastMessageAll("In Range", 10)
                end

            end
        end
    end
    timer.scheduleFunction(TriggerZonesHandler, nil, timer.getTime() + 5)  -- Fonction runs every 3 second
end
TriggerZonesHandler() -- Initialize Loop (1s)