-----------------------------------
-- func: fish
-- desc: Fish with PVP enabled
-----------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    local target
    target = player

    target:startFish()
end
