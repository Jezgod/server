-----------------------------------
-- Ability: Provoke
-- Job: Warrior
-----------------------------------
local abilityObject = {}

<<<<<<< Updated upstream
abilityObject.onAbilityCheck = function(player, target, ability)
=======
ability_object.onAbilityCheck = function(player, target, ability)
    local time = ability:getRecast() - 5
    local mJob = player:getMainJob()
    local sJob = player:getSubJob()

    if (mJob == 1 or mSjob == 1) then
        ability:setRecast(time)
    else
    end

>>>>>>> Stashed changes
    return 0, 0
end

abilityObject.onUseAbility = function(user, target, ability)
    --Leave blank.
end

return abilityObject
