listInTR = {}

function PlayerEnteredRange(initiator)
    -- BerthAPI.BroadcastMessageAll("Player entered the training range.", 10)
    BerthAPI.UnitEntersZone("Range Trigger Zone")
end


-- function PlayerExitedRange(initiator)
--     trigger.action.outText("Player " .. initiator .. " exited the training range.", 10)
-- end