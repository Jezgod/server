-----------------------------------
-- Area: Port Bastok
--  NPC: Valah Molkot
-- Starts and Finishes Quest: A Lady's Heart
-- !pos 59 8 -221 236
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/quests")
local ID = require("scripts/zones/Port_Bastok/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local aLadysHeart = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.A_LADYS_HEART)

    if itemQuality == 2 then
        if aLadysHeart == QUEST_COMPLETED then
            player:startEvent(160, 0, 236, 4)
        else
            player:startEvent(160, 0, 236, 2)
        end
    elseif itemQuality == 1 then
        if aLadysHeart == QUEST_COMPLETED then
            player:startEvent(160, 0, 236, 5)
        elseif aLadysHeart == QUEST_ACCEPTED then
            player:startEvent(160, 0, 236, 3)
        else
            player:startEvent(160, 0, 236, 1)
        end
    else
        player:startEvent(160, 0, 236, 0)
    end
end

entity.onTrigger = function(player, npc)
    player:startEvent(160, 0, 236, 10)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
