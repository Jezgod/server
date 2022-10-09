-----------------------------------
--
-- Contains global functions and variables
-- related to PVP area specific things
--
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

xi = xi or {}

xi.pvpZoneStatus =
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
        [xi.zone.NORG]                   = {data = {name = "NORG", color = "WHITE", desc = "PVP Disabled."}},


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
        [xi.zone.SEA_SERPENT_GROTTO]     = {data = {name = "SEA_SERPENT_GROTTO", color = "ORANGE", desc = "Mandatory PVP Enabled/Restricted."}},  


        -- BLACK ZONES
}