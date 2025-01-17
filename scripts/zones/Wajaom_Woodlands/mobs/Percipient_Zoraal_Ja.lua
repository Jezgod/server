-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Percipient Zoraal Ja
-----------------------------------
local ID = require("scripts/zones/Wajaom_Woodlands/IDs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    -- make pkuucha killable
    local pet = GetMobByID(ID.mob.ZORAAL_JA_S_PKUUCHA)
    if (pet ~= nil) then
        pet:setUnkillable(false)
        if (pet:getHPP() <= 1) then
            pet:setHP(0)
        end
    end
end

return entity
