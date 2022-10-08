---------------------------------------------------------------------------------------------------
-- func: pvp
-- desc: enables PVP flag in an eligible zone
---------------------------------------------------------------------------------------------------
require("scripts/globals/zone") 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

local pvpZoneStatus =
{
        -- WHITE ZONES
        [xi.zone.SOUTH_GUSTABERG]        = {data = {name = "SOUTH_GUSTABERG", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.NORTH_GUSTABERG]        = {data = {name = "NORTH_GUSTABERG", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.BASTOK_MARKETS]         = {data = {name = "BASTOK_MARKETS", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.BASTOK_MINES]           = {data = {name = "BASTOK_MINES", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.METALWORKS]             = {data = {name = "METALWORKS", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.PORT_BASTOK]            = {data = {name = "PORT_BASTOK", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.PORT_WINDURST]          = {data = {name = "PORT_WINDURST", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.WINDURST_WATERS]        = {data = {name = "WINDURST_WATERS", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.WINDURST_WALLS]         = {data = {name = "WINDURST_WALLS", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.WINDURST_WOODS]         = {data = {name = "WINDURST_WOODS", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.HEAVENS_TOWER]          = {data = {name = "HEAVENS_TOWER", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.WEST_SARUTABARUTA]      = {data = {name = "WEST_SARUTABARUTA", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.EAST_SARUTABARUTA]      = {data = {name = "EAST_SARUTABARUTA", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.MHAURA]                 = {data = {name = "MHAURA", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.SELBINA]                = {data = {name = "SELBINA", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.PORT_JEUNO]             = {data = {name = "PORT_JEUNO", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.LOWER_JEUNO]            = {data = {name = "LOWER_JEUNO", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.UPPER_JEUNO]            = {data = {name = "UPPER_JEUNO", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.RULUDE_GARDENS]         = {data = {name = "RULUDE_GARDENS", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.WEST_RONFAURE]          = {data = {name = "WEST_RONFAURE", color = "WHITE", desc = "PVP Disabled."}},
        [xi.zone.EAST_RONFAURE]          = {data = {name = "EAST_RONFAURE", color = "WHITE", desc = "PVP Disabled."}},


        -- YELLOW ZONES
        [xi.zone.DANGRUF_WADI]           = {data = {name = "DANGRUF_WADI", color = "YELLOW", desc = "Optional PVP Enabled/Restricted."}},
        [xi.zone.ZERUHN_MINES]           = {data = {name = "ZERUHN_MINES", color = "YELLOW", desc = "Optional PVP Enabled/Restricted."}},
        [xi.zone.PALBOROUGH_MINES]       = {data = {name = "PALBOROUGH_MINES", color = "YELLOW", desc = "Optional PVP Enabled/Restricted."}},
        [xi.zone.KORROLOKA_TUNNEL]       = {data = {name = "KORROLOKA_TUNNEL", color = "YELLOW", desc = "Optional PVP Enabled/Restricted."}},
        [xi.zone.KONSCHTAT_HIGHLANDS]    = {data = {name = "KONSCHTAT_HIGHLANDS", color = "YELLOW", desc = "Optional PVP Enabled/Restricted."}},
        [xi.zone.GUSGEN_MINES]           = {data = {name = "GUSGEN_MINES", color = "YELLOW", desc = "Optional PVP Enabled/Restricted."}},
        [xi.zone.VALKURM_DUNES]          = {data = {name = "VALKURM_DUNES", color = "YELLOW", desc = "Optional PVP Enabled/Restricted."}},
        [xi.zone.TAHRONGI_CANYON]        = {data = {name = "TAHRONGI_CANYON", color = "YELLOW", desc = "Optional PVP Enabled/Restricted."}},
        [xi.zone.MAZE_OF_SHAKHRAMI]      = {data = {name = "MAZE_OF_SHAKHRAMI", color = "YELLOW", desc = "Optional PVP Enabled/Restricted."}},
        [xi.zone.BUBURIMU_PENINSULA]     = {data = {name = "BUBURIMU_PENINSULA", color = "YELLOW", desc = "Optional PVP Enabled/Restricted."}},
        [xi.zone.MERIPHATAUD_MOUNTAINS]  = {data = {name = "MERIPHATAUD_MOUNTAINS", color = "YELLOW", desc = "Optional PVP Enabled/Restricted."}},
        [xi.zone.KING_RANPERRES_TOMB]    = {data = {name = "KING_RANPERRES_TOMB", color = "YELLOW", desc = "Optional PVP Enabled/Restricted."}},



        -- ORANGE ZONES
        [xi.zone.SAUROMUGUE_CHAMPAIGN]   = {data = {name = "SAUROMUGUE_CHAMPAIGN", color = "ORANGE", desc = "Optional PVP Enabled/Unrestricted."}},
        [xi.zone.ROLANBERRY_FIELDS]      = {data = {name = "ROLANBERRY_FIELDS", color = "ORANGE", desc = "Optional PVP Enabled/Unrestricted."}}, 
        [xi.zone.BATALLIA_DOWNS]         = {data = {name = "BATALLIA_DOWNS", color = "ORANGE", desc = "Optional PVP Enabled/Unrestricted."}}, 


        -- RED ZONES
        [xi.zone.GARLAIGE_CITADEL]       = {data = {name = "GARLAIGE_CITADEL", color = "ORANGE", desc = "Mandatory PVP Enabled/Restricted."}},
        [xi.zone.CRAWLERS_NEST]          = {data = {name = "CRAWLERS_NEST", color = "ORANGE", desc = "Mandatory PVP Enabled/Restricted."}},
        [xi.zone.THE_ELDIEME_NECROPOLIS] = {data = {name = "THE_ELDIEME_NECROPOLIS", color = "ORANGE", desc = "Mandatory PVP Enabled/Restricted."}},


        -- BLACK ZONES
}

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
	
	if validZone(zone_list, zone) == true then
		-- player:PrintToPlayer( string.format("PVP cannot be enabled in this zone."), 29)
                player:PrintToPlayer( string.format("%s zone status: [[[ %s ]]]", pvpZoneStatus[zone].data.name, pvpZoneStatus[zone].data.color), 29)
                player:PrintToPlayer( string.format("%s", pvpZoneStatus[zone].data.desc), 29)
        elseif (pvp == 1) then
                player:PrintToPlayer( string.format("PVP already enabled."), 29 )
                return 1
    	else
		allegiance = nation + 2
     		player:setAllegiance( allegiance )
		player:PrintToPlayer( string.format("!!! PVP Enabled !!!"),29 )
		player:PrintToPlayer( string.format("Allegiance set to %s", nationByNum[allegiance]), 29 )
                player:PrintToPlayer( string.format("%s zone status: [[[ %s ]]]", pvpZoneStatus[zone].data.name, pvpZoneStatus[zone].data.color), 29)
                player:PrintToPlayer( string.format("%s", pvpZoneStatus[zone].data.desc), 29)
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