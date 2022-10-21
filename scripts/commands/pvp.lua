---------------------------------------------------------------------------------------------------
-- func: pvp
-- desc: enables PVP flag in an eligible zone
---------------------------------------------------------------------------------------------------
require('scripts/globals/zone_pvp')
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

--[[
local zone_list =
{
	26,  -- Tavnazian Safehold 
        32,  -- Sealion's Den
	48,  -- Al Zahbi
	50,  -- Aht Urhgan Whitegate
        53,  -- Nashmau
        80,  -- Southern San d'Oria [S]
        87,  -- Bastok Markets [S]
        94,  -- Windurst Waters [S]
        100, -- West Ronfaure
        101, -- East Ronfaure
        106, -- North Gustaberg
        107, -- South Gustaberg
        115, -- West Sarutabaruta
        116, -- East Sarutabaruta
	230, -- Southern San d'Oria
    	231, -- Northern San d'Oria
    	232, -- Port San d'Oria
    	233, -- Chateau d'Oraguille
	234, -- Bastok Mines
	235, -- Bastok Markets
	236, -- Port Bastok
	237, -- Metalworks
	238, -- Windurst Waters
    	239, -- Windurst Walls
    	240, -- Port Windurst
    	241, -- Windurst Woods
    	242, -- Heavens Tower
    	243, -- Ru'Lude Gardens
    	244, -- Upper Jeuno
    	245, -- Lower Jeuno
    	246, -- Port Jeuno
    	247, -- Rabao
    	248, -- Selbina
    	249, -- Mhaura
    	250, -- Kazham
    	251, -- Hall of the Gods
    	252, -- Norg
	256, -- Western Adoulin
	257, -- Eastern Adoulin
}

local function validZone(zone_list, id)
	for k,v in pairs(zone_list) do
		if v == id then
		return true
 		end
 	end
end
--]]

-- invert xi.zone table
    local zoneNameByNum={}
    for k, v in pairs(xi.zone) do
        zoneNameByNum[v]=k
    end

function onTrigger(player)
	zone = player:getZoneID()
        pvp = player:getCharVar("pvp_flag")
	local nationByNum = {
		[0] = "None",
        	[1] = "Player",
        	[2] = "San d'Oria",
        	[3] = "Bastok",
        	[4] = "Windurst"
    	}
	
        -- set player status
	nation = player:getNation()
    	allegiance = 0
	
	--if validZone(zone_list, zone) == true then
        --        player:PrintToPlayer( string.format("%s zone status: [[[ %s ]]]", xi.pvpZoneStatus[zone].data.name, xi.pvpZoneStatus[zone].data.color), 29)
        --        player:PrintToPlayer( string.format("%s", xi.pvpZoneStatus[zone].data.desc), 29)
        --if player:isInMogHouse() then
        --        player:PrintToPlayer( string.format("Cannot enable PVP in Mog House."), 29 )
        if xi.pvpZoneStatus[zone].data.color == "WHITE" then
                player:PrintToPlayer( string.format("%s zone status: [[[ %s ]]]", xi.pvpZoneStatus[zone].data.name, xi.pvpZoneStatus[zone].data.color), 29)
                player:PrintToPlayer( string.format("%s", xi.pvpZoneStatus[zone].data.desc), 29)
        elseif (pvp == 1) then
                player:PrintToPlayer( string.format("PVP already enabled."), 29 )
                return 1
    	else
		allegiance = nation + 2
     		player:setAllegiance( allegiance )
		player:PrintToPlayer( string.format("!!! PVP Enabled !!!"),29 )
		player:PrintToPlayer( string.format("Allegiance set to %s", nationByNum[allegiance]), 29 )
                player:PrintToPlayer( string.format("%s zone status: [[[ %s ]]]", xi.pvpZoneStatus[zone].data.name, xi.pvpZoneStatus[zone].data.color), 29)
                player:PrintToPlayer( string.format("%s", xi.pvpZoneStatus[zone].data.desc), 29)
		player:setAnimation(33)
		player:timer(5000, function(player)
		player:setAnimation(0)
		end)

		if (player:hasPet()) then
		    player:despawnPet()
		else
		end

		player:setCharVar("pvp_flag", 1)
		player:lockstyleOn()
   	end	
end