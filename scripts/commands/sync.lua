---------------------------------------------------------------------------------------------------
-- func: sync
-- desc: pvp sync in yellow/red zones
---------------------------------------------------------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    local pvpstate = player:getCharVar("pvp_flag")
    local pNation = player:getNation()
    local tNation
    local id = 269
    local duration = 120
    local subId = 0
    local subPower = 0
    local level
    local targ = player:getCursorTarget()
    local targetType
    local time = os.time()
    local remaining
    local cooldown = player:getLocalVar("sync_cd")
    local pLevel = player:getMainLvl()

    if (targ ~= nil) then
        targetType = targ:getObjType()

        if (player:hasStatusEffect(xi.effect.LEVEL_SYNC)) then
            player:PrintToPlayer("Level sync already enabled!")
            return
        end

        if targetType == xi.objType.NPC then
            player:PrintToPlayer("Cannot sync to NPC!")
            return
        elseif targetType == xi.objType.MOB then
            player:PrintToPlayer("Cannot sync to MOB!")
            return
        elseif targetType == xi.objType.PET then
            player:PrintToPlayer("Cannot sync to PET!")
            return
        end
        
        level = targ:getMainLvl()
        tNation = targ:getNation()
        
        if (player:getID() == targ:getID()) then
             player:PrintToPlayer(string.format("Cannot sync to yourself!", xi.msg.channel.SYSTEM_3)) 

        elseif (pvpstate ~= 1) then
             player:PrintToPlayer("PVP is not enabled.")

        elseif (targetType ~= xi.objType.PC) then
            player:PrintToPlayer("Cannot sync to non-PC target!")

        elseif (pNation == tNation) then
            player:PrintToPlayer("Cannot sync to PC target of the same nation!")

        elseif (targ:getCharVar("pvp_flag") ~= 1) then
            player:PrintToPlayer("Cannot sync to PC target with its PVP disabled!")

        elseif (cooldown > time) then 
            player:PrintToPlayer("120 second cooldown has not finished.")
            remaining = cooldown - os.time()
            player:PrintToPlayer( string.format("Cannot sync for %i seconds.", remaining))

        elseif (level > pLevel) then 
             player:PrintToPlayer("Cannot sync to a higher target!")

        elseif (pvpstate == 1 and cooldown == nil) then
            player:PrintToPlayer( string.format("Level set to %i for 120 seconds to engage target.", level, xi.msg.channel.SYSTEM_3))
            player:setLocalVar("sync_cd", os.time() + 120)
            player:delStatusEffectsByFlag(xi.effectFlag.DISPELABLE)
            player:delStatusEffectsByFlag(xi.effectFlag.ON_ZONE)
            player:delStatusEffectsByFlag(xi.effectFlag.ON_JOBCHANGE)
            -- Set level for 120 seconds
            player:addStatusEffect(id, level, 3, duration, subId, subPower)

        elseif (pvpstate == 1 and cooldown < time) then
            player:PrintToPlayer( string.format("Level set to %i for 120 seconds to engage target.", level, xi.msg.channel.SYSTEM_3))
            cooldown = player:setLocalVar("sync_cd", os.time() + 120)
            player:delStatusEffectsByFlag(xi.effectFlag.DISPELABLE)
            player:delStatusEffectsByFlag(xi.effectFlag.ON_ZONE)
            player:delStatusEffectsByFlag(xi.effectFlag.ON_JOBCHANGE)
            -- Set level for 120 seconds
            player:addStatusEffect(id, level, 3, duration, subId, subPower)

        else

            player:PrintToPlayer("Cannot sync at the current time.")

        end

    else

        player:PrintToPlayer( string.format("Must select a target using in game cursor first.", xi.msg.channel.SYSTEM_3))

    end

end
