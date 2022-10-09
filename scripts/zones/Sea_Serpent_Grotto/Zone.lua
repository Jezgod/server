-----------------------------------
-- Zone: Sea_Serpent_Grotto (176)
-----------------------------------
local ID = require('scripts/zones/Sea_Serpent_Grotto/IDs')
require('scripts/globals/conquest')
require('scripts/globals/treasure')
require('scripts/globals/zone_pvp')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    -- Charybdis PH alternates, remove one
    local keys = {}

    for k, v in pairs(ID.mob.CHARYBDIS_PH) do
        table.insert(keys, k)
    end

    DespawnMob(keys[math.random(#keys)])

    xi.treasure.initZone(zone)
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    -- set player status
    zone = player:getZoneID()
    nation = player:getNation()
    allegiance = 0

    allegiance = nation + 2
    player:setAllegiance(allegiance)
    player:timer(5000, function(player)
        player:setCharVar("pvp_flag", 1)
        player:lockstyleOn()
        player:PrintToPlayer( string.format("%s zone status: [[[ %s ]]]", xi.pvpZoneStatus[zone].data.name, xi.pvpZoneStatus[zone].data.color), 29)
        player:PrintToPlayer( string.format("%s", xi.pvpZoneStatus[zone].data.desc), 29)
        end)

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-60.566, -2.127, 412, 54)
    end

    return cs
end

zoneObject.onRegionEnter = function(player, region)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

return zoneObject
