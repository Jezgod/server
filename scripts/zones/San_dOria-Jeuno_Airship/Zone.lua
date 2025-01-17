-----------------------------------
-- Zone: San_dOria-Jeuno_Airship
-----------------------------------
local ID = require('scripts/zones/San_dOria-Jeuno_Airship/IDs')
require('scripts/globals/zone')
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 or player:getYPos() == 0 or player:getZPos() == 0 then
        player:setPos(math.random(-4, 4), 1, math.random(-23, -12))
    end

    return cs
end

zone_object.onTransportEvent = function(player, transport)
    player:startEvent(100)
end

zone_object.onGameHour = function(zone)
    local qmObj        = zone:queryEntitiesByName('qm1')[1]
    local vanadielHour = VanadielHour()

    if
        IsMoonFull() and
        vanadielHour >= 18 and
        vanadielHour < 6
    then
        qmObj:setStatus(xi.status.NORMAL)
    else
        qmObj:setStatus(xi.status.DISAPPEAR)
    end
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    if csid == 100 then
        local prevzone = player:getPreviousZone()

        if prevzone == xi.zone.PORT_JEUNO then
            player:setPos(0, 0, 0, 0, 232)
        elseif prevzone == xi.zone.PORT_SAN_DORIA then
            player:setPos(0, 0, 0, 0, 246)
        end
    end
end

return zone_object
