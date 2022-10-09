-----------------------------------
-- Zone: Crawlers_Nest (197)
-----------------------------------
local ID = require('scripts/zones/Crawlers_Nest/IDs')
require('scripts/globals/conquest')
require('scripts/globals/treasure')
require('scripts/globals/zone_pvp')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    UpdateNMSpawnPoint(ID.mob.DYNAST_BEETLE)
    GetMobByID(ID.mob.DYNAST_BEETLE):setRespawnTime(math.random(5400, 7200))

    xi.treasure.initZone(zone)
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
        player:setPos(380.617, -34.61, 4.581, 59)
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onRegionEnter = function(player, region)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

return zoneObject
