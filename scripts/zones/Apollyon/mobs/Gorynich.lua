-----------------------------------
-- Area: Apollyon NW, Floor 4
--  Mob: Gorynich
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")
require("scripts/zones/Apollyon/bcnms/nw_apollyon_helper")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

local flags = xi.path.flag.WALLHACK
local path =
{
    [1] = { { -539.394,  0.000, 641.592 }, { -567.000, 0.000, 603.000 } },
    [2] = { { -580.011,  0.000, 576.735 }, { -600.000, 0.000, 570.000 } },
    [3] = { { -571.528, -0.020, 571.475 }, { -616.399, 0.000, 530.164 } },
    [4] = { { -601.184,  0.000, 520.187 }, { -564.906, 0.000, 533.680 } },
    [5] = { { -521.053,  0.000, 628.834 }, { -555.000, 0.000, 614.000 } }
}

entity.onPath = function(mob)
    if
        mob:getID() ~= ID.mob.APOLLYON_NW_MOB[4] + 1 and
        mob:getID() ~= ID.mob.APOLLYON_NW_MOB[4] + 4
    then
        mob:setLocalVar("pause", os.time() + 5)
    end
end

entity.onMobRoam = function(mob)
    local offset = mob:getID() - ID.mob.APOLLYON_NW_MOB[4]
    local pause  = mob:getLocalVar("pause")

    if pause < os.time() then
        local point = (mob:getLocalVar("point") % 2) + 1
        mob:setLocalVar("point", point)
        mob:pathTo(path[offset][point][1], path[offset][point][2], path[offset][point][3], flags)

        if
            mob:getID() == ID.mob.APOLLYON_NW_MOB[4] + 1 or
            mob:getID() == ID.mob.APOLLYON_NW_MOB[4] + 4
        then
            mob:setLocalVar("pause", os.time() + 20)
        else
            mob:setLocalVar("pause", os.time() + 60)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    xi.apollyon_nw.handleMobDeathFloorFourPortal(mob, player, optParams)
end

return entity
