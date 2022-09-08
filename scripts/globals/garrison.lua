-----------------------------------
-- Garrison
-----------------------------------
require('scripts/globals/mobs')
require('scripts/globals/common')
require('scripts/globals/npc_util')
require('scripts/globals/status')
require('scripts/globals/utils')
require('scripts/globals/zone')
require('scripts/globals/pathfind')
-----------------------------------
xi = xi or {}
xi.garrison = xi.garrison or {}
xi.garrison.lookup = xi.garrison.lookup or {}

-----------------------------------
-- Data
-----------------------------------

-- Loot for each Garrison, by level
xi.garrison.loot =
{
    [20] =
    {
        { itemId = xi.items.DRAGON_CHRONICLES, dropRate = 1000 },
        { itemId = xi.items.GARRISON_TUNICA,   dropRate = 350  },
        { itemId = xi.items.GARRISON_BOOTS,    dropRate = 350  },
        { itemId = xi.items.GARRISON_HOSE,     dropRate = 350  },
        { itemId = xi.items.GARRISON_GLOVES,   dropRate = 350  },
        { itemId = xi.items.GARRISON_SALLET,   dropRate = 350  },
    },
    [30] =
    {
        { itemId = xi.items.DRAGON_CHRONICLES, dropRate = 1000 },
        { itemId = xi.items.MILITARY_GUN,      dropRate = 350  },
        { itemId = xi.items.MILITARY_POLE,     dropRate = 350  },
        { itemId = xi.items.MILITARY_HARP,     dropRate = 350  },
        { itemId = xi.items.MILITARY_PICK,     dropRate = 350  },
        { itemId = xi.items.MILITARY_SPEAR,    dropRate = 350  },
        { itemId = xi.items.MILITARY_AXE,      dropRate = 350  },
    },
    [40] =
    {
        { itemId = xi.items.DRAGON_CHRONICLES, dropRate = 1000 },
        { itemId = xi.items.VARIABLE_MANTLE,   dropRate = 350  },
        { itemId = xi.items.VARIABLE_CAPE,     dropRate = 350  },
        { itemId = xi.items.PROTEAN_RING,      dropRate = 350  },
        { itemId = xi.items.VARIABLE_RING,     dropRate = 350  },
        { itemId = xi.items.MECURIAL_EARRING,  dropRate = 350  },
    },
    [50] =
    {
        { itemId = xi.items.DRAGON_CHRONICLES, dropRate = 1000 },
        { itemId = xi.items.UNDEAD_EARRING,    dropRate = 350  },
        { itemId = xi.items.ARCANA_EARRING,    dropRate = 350  },
        { itemId = xi.items.VERMIN_EARRING,    dropRate = 350  },
        { itemId = xi.items.BIRD_EARRING,      dropRate = 350  },
        { itemId = xi.items.AMORPH_EARRING,    dropRate = 350  },
        { itemId = xi.items.LIZARD_EARRING,    dropRate = 350  },
        { itemId = xi.items.AQUAN_EARRING,     dropRate = 350  },
        { itemId = xi.items.PLANTOID_EARRING,  dropRate = 350  },
        { itemId = xi.items.BEAST_EARRING,     dropRate = 350  },
        { itemId = xi.items.DEMON_EARRING,     dropRate = 350  },
        { itemId = xi.items.DRAGON_EARRING,    dropRate = 350  },
        { itemId = xi.items.REFRESH_EARRING,   dropRate = 350  },
        { itemId = xi.items.ACCURATE_EARRING,  dropRate = 350  },
    },
    [99] =
    {
        { itemId = xi.items.MIRATETES_MEMOIRS, dropRate = 1000 },
        { itemId = xi.items.MIGHTY_BOW,        dropRate = 350  },
        { itemId = xi.items.MIGHTY_CUDGEL,     dropRate = 350  },
        { itemId = xi.items.MIGHTY_POLE,       dropRate = 350  },
        { itemId = xi.items.MIGHTY_TALWAR,     dropRate = 350  },
        { itemId = xi.items.RAI_KUNIMITSU,     dropRate = 350  },
        { itemId = xi.items.NUKEMARU,          dropRate = 350  },
        { itemId = xi.items.MIGHTY_PICK,       dropRate = 350  },
        { itemId = xi.items.MIGHTY_KNIFE,      dropRate = 350  },
        { itemId = xi.items.MIGHTY_ZAGHNAL,    dropRate = 350  },
        { itemId = xi.items.MIGHTY_LANCE,      dropRate = 350  },
        { itemId = xi.items.MIGHTY_AXE,        dropRate = 350  },
        { itemId = xi.items.MIGHTY_PATAS,      dropRate = 350  },
        { itemId = xi.items.MIGHTY_SWORD,      dropRate = 350  },
    },
}

-- Zone Data, used for the spawning of enemies and allies
xi.garrison.data =
{
    [xi.zone.WEST_RONFAURE] =
    {
        itemReq = xi.items.RED_CRYPTEX,
        textRegion = 0,
        levelCap = 20,
        mobBoss = "Orcish_Fighterchief",
        xPos = -436,
        yPos = -20,
        zPos = -217,
        xChange = 0,
        zChange = 2,
        xSecondLine = 2,
        zSecondLine = 0,
        xThirdLine = 4,
        zThirdLine = 0,
        rot = 0,
    },
    [xi.zone.NORTH_GUSTABERG] =
    {
        itemReq = xi.items.DARKSTEEL_ENGRAVING,
        textRegion = 1,
        levelCap = 20,
        mobBoss = "Lead_Quadav",
        xPos = -580, -- TODO: Needs adjusting
        yPos = 40,
        zPos = 69,
        xChange = 1,
        zChange = 2,
        xSecondLine = 2,
        zSecondLine = 0,
        xThirdLine = 4,
        zThirdLine = 0,
        rot = 106,
    },
    [xi.zone.WEST_SARUTABARUTA] =
    {
        itemReq = xi.items.SEVEN_KNOT_QUIPU,
        textRegion = 2,
        levelCap = 20,
        mobBoss = "Yagudo_Condottiere",
        xPos = -20, -- TODO: Needs adjusting
        yPos = -12,
        zPos = 325,
        xChange = 0,
        zChange = 2,
        xSecondLine = 2,
        zSecondLine = 0,
        xThirdLine = 4,
        zThirdLine = 0,
        rot = 115,
    },
    [xi.zone.VALKURM_DUNES] =
    {
        itemReq = xi.items.GALKA_FANG_SACK,
        textRegion = 3,
        levelCap = 30,
        mobBoss = "Goblin_Swindler",
        xPos = 141, -- TODO: Needs adjusting
        yPos = -8,
        zPos = 87,
        xChange = -2,
        zChange = -2,
        xSecondLine = 2,
        zSecondLine = 0,
        xThirdLine = 4,
        zThirdLine = 0,
        rot = 32,
    },
    [xi.zone.JUGNER_FOREST] =
    {
        itemReq = xi.items.JADE_CRYPTEX,
        textRegion = 4,
        levelCap = 30,
        mobBoss = "Orcish_Colonel",
        xPos = 54, -- TODO: Needs adjusting
        yPos = 1,
        zPos = -1,
        xChange = -2,
        zChange = 0,
        xSecondLine = 0,
        zSecondLine = 2,
        xThirdLine = 0,
        zThirdLine = 4,
        rot = 210,
    },
    [xi.zone.PASHHOW_MARSHLANDS] =
    {
        itemReq = xi.items.SILVER_ENGRAVING,
        textRegion = 5,
        levelCap = 30,
        mobBoss = "Cobalt_Quadav",
        xPos = 458, -- TODO: Needs adjusting
        yPos = 24,
        zPos = 421,
        xChange = -2,
        zChange = -2,
        xSecondLine = 2,
        zSecondLine = 0,
        xThirdLine = 4,
        zThirdLine = 0,
        rot = 130,
    },
    [xi.zone.BUBURIMU_PENINSULA] =
    {
        itemReq = xi.items.MITHRA_FANG_SACK,
        textRegion = 6,
        levelCap = 30,
        mobBoss = "Goblin_Guide",
        xPos = -485, -- TODO: Needs adjusting
        yPos = -29,
        zPos = 58,
        xChange = -2,
        zChange = 0,
        xSecondLine = 0,
        zSecondLine = -2,
        xThirdLine = 0,
        zThirdLine = -4,
        rot = 0,
    },
    [xi.zone.MERIPHATAUD_MOUNTAINS] =
    {
        itemReq = xi.items.THIRTEEN_KNOT_QUIPU,
        textRegion = 7,
        levelCap = 30,
        mobBoss = "Yagudo_Missionary",
        xPos = -299, -- TODO: Needs adjusting
        yPos = 17,
        zPos = 411,
        xChange = 2,
        zChange = -2,
        xSecondLine = 0,
        zSecondLine = 2,
        xThirdLine = 0,
        zThirdLine = 4,
        rot = 30,
    },
    [xi.zone.QUFIM_ISLAND] =
    {
        itemReq = xi.items.RAM_LEATHER_MISSIVE,
        textRegion = 10,
        levelCap = 30,
        mobBoss = "Hunting_Chief",
        xPos = -247, -- TODO: Needs adjusting
        yPos = -19,
        zPos = 310,
        xChange = -2,
        zChange = 0,
        xSecondLine = 0,
        zSecondLine = -2,
        xThirdLine = 0,
        zThirdLine = -4,
        rot = 0,
    },
    [xi.zone.BEAUCEDINE_GLACIER] =
    {
        itemReq = xi.items.TIGER_LEATHER_MISSIVE,
        textRegion = 8,
        levelCap = 40,
        mobBoss = "Gigas_Overseer",
        xPos = -25, -- TODO: Needs adjusting
        yPos = -60,
        zPos = -110,
        xChange = -2,
        zChange = -1,
        xSecondLine = 0,
        zSecondLine = -1,
        xThirdLine = 0,
        zThirdLine = -2,
        rot = 220,
    },
    [xi.zone.THE_SANCTUARY_OF_ZITAH] =
    {
        itemReq = xi.items.HOUND_FANG_SACK,
        textRegion = 11,
        levelCap = 40,
        mobBoss = "Goblin_Doyen",
        xPos = -43,
        yPos = 1,
        zPos = -140,
        xChange = -2,
        zChange = 0,
        xSecondLine = 0,
        zSecondLine = 2,
        xThirdLine = 0,
        zThirdLine = 4,
        rot = 180,
    },
    [xi.zone.YUHTUNGA_JUNGLE] =
    {
        itemReq = xi.items.SHEEP_LEATHER_MISSIVE,
        textRegion = 14,
        levelCap = 40,
        mobBoss = "Sahagin_Patriarch",
        xPos = -248,
        yPos = 1,
        zPos = -392,
        xChange = -2,
        zChange = 0,
        xSecondLine = 0,
        zSecondLine = 2,
        xThirdLine = 0,
        zThirdLine = 4,
        rot = 180,
    },
    [xi.zone.XARCABARD] =
    {
        itemReq = xi.items.BEHEMOTH_LEATHER_MISSIVE,
        textRegion = 9,
        levelCap = 50,
        mobBoss = "Demon_Aristocrat",
        xPos = 216, -- TODO: Needs adjusting
        yPos = -22,
        zPos = -208,
        xChange = 2,
        zChange = 0,
        xSecondLine = 0,
        zSecondLine = 2,
        xThirdLine = 0,
        zThirdLine = 4,
        rot = 90,
    },
    [xi.zone.EASTERN_ALTEPA_DESERT] =
    {
        itemReq = xi.items.DHALMEL_LEATHER_MISSIVE,
        textRegion = 12,
        levelCap = 50,
        mobBoss = "Centurio_XIII-V",
        xPos = -245,
        yPos = -9,
        zPos = -249,
        xChange = 0,
        zChange = 2,
        xSecondLine = 2,
        zSecondLine = 0,
        xThirdLine = 4,
        zThirdLine = 0,
        rot = 0,
    },
    [xi.zone.YHOATOR_JUNGLE] =
    {
        itemReq = xi.items.COEURL_LEATHER_MISSIVE,
        textRegion = 15,
        levelCap = 50,
        mobBoss = "Tonberry_Decimator",
        xPos = 214,
        yPos = 1,
        zPos = -80,
        xChange = 1,
        zChange = 2,
        xSecondLine = 2,
        zSecondLine = -1,
        xThirdLine = 4,
        zThirdLine = -2,
        rot = 0,
    },
    [xi.zone.CAPE_TERIGGAN] =
    {
        itemReq = xi.items.BUNNY_FANG_SACK,
        textRegion = 13,
        levelCap = 99, -- Level_Restriction 99
        mobBoss = "Goblin_Boss",
        xPos = -174,
        yPos = 8,
        zPos = -61,
        xChange = 0,
        zChange = 2,
        xSecondLine = 2,
        zSecondLine = 0,
        xThirdLine = 4,
        zThirdLine = 0,
        rot = 0,
    },
}
-----------------------------------
-- Helpers
-----------------------------------

xi.garrison.onWin = function(player, npc)
end

xi.garrison.onLose = function(player, npc)
end

xi.garrison.onStatusRemove = function(player, npc)
end

xi.garrison.mobsAlive = function(player)
end

xi.garrison.npcAlive = function(player)
end

xi.garrison.despawnNPCs = function(npc)
end

xi.garrison.clearNPCs = function(zone)
end

xi.garrison.returnHome = function(mob)
end

xi.garrison.npcTableEmpty = function(zone)
end

-----------------------------------
-- Main Functions
-----------------------------------

xi.garrison.tick = function(player, npc, wave, party)
end

xi.garrison.spawnNPCs = function(npc, party)
end

xi.garrison.spawnWave = function(player, npc, wave, party)
end

xi.garrison.start = function(player, npc, party)
end

xi.garrison.onTrade = function(player, npc, trade, guardNation)
    return false
end

-- Get dialog fron guard after winning or losing
xi.garrison.onTrigger = function(player, npc)
    return false
end

-- Zone tick Create NPC Tables if empty
xi.garrison.buildNpcTable = function(zone)
end
