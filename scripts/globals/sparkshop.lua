-----------------------------------
-- Spark Shop
-- TO DO: Add Naakaul Seven Treasures
-----------------------------------
require('scripts/globals/npc_util')
require('scripts/globals/zone')
require('scripts/globals/items')
require('scripts/globals/extravaganza')
-----------------------------------

xi = xi or {}
xi.sparkshop = xi.sparkshop or {}

local optionToItem =
{
    [1] = { -- Items page
        [ 0] = { cost =    10, id =  4181 }, -- Scroll of Instant Warp
        [ 1] = { cost =    10, id =  4182 }, -- Scroll of Instant Reraise
        [ 2] = { cost =  7500, id =  4064 }, -- Copy of Rem's Tale, chapter 1
        [ 3] = { cost =  7500, id =  4065 }, -- Copy of Rem's Tale, chapter 2
        [ 4] = { cost =  7500, id =  4066 }, -- Copy of Rem's Tale, chapter 3
        [ 5] = { cost =  7500, id =  4067 }, -- Copy of Rem's Tale, chapter 4
        [ 6] = { cost =  7500, id =  4068 }, -- Copy of Rem's Tale, chapter 5
        [ 7] = { cost = 15000, id =  4069 }, -- Copy of Rem's Tale, chapter 6
        [ 8] = { cost = 15000, id =  4070 }, -- Copy of Rem's Tale, chapter 7
        [ 9] = { cost = 15000, id =  4071 }, -- Copy of Rem's Tale, chapter 8
        [10] = { cost = 15000, id =  4072 }, -- Copy of Rem's Tale, chapter 9
        [11] = { cost = 15000, id =  4073 }, -- Copy of Rem's Tale, chapter 10
        [12] = { cost =  5000, id = 28546 }, -- Capacity Ring
        [13] = { cost = 10000, id =  9009 }, -- Etched Memory
    },
    [2] = { -- Skill-increasing tomes
        [ 0] = { cost = 200, id = 6147 }, -- Mikehe's memo
        [ 1] = { cost = 200, id = 6148 }, -- Dagger enchiridion
        [ 2] = { cost = 200, id = 6149 }, -- Swing and Stab
        [ 3] = { cost = 200, id = 6150 }, -- Mieuseloir's diary
        [ 4] = { cost = 200, id = 6151 }, -- Striking Bull's diary
        [ 5] = { cost = 200, id = 6152 }, -- Death of Dimwits
        [ 6] = { cost = 200, id = 6153 }, -- Ludwig's report
        [ 7] = { cost = 200, id = 6154 }, -- Clash of Titans
        [ 8] = { cost = 200, id = 6155 }, -- Kagetora's diary
        [ 9] = { cost = 200, id = 6156 }, -- Noillurie's log
        [10] = { cost = 200, id = 6157 }, -- Ferreous's diary
        [11] = { cost = 200, id = 6158 }, -- Kayeel-Payeel's memoirs
        [12] = { cost = 200, id = 6159 }, -- Perih's primer
        [13] = { cost = 200, id = 6160 }, -- Barrels of Fun
        [14] = { cost = 200, id = 6161 }, -- Throwing weapon enchiridion
        [15] = { cost = 200, id = 6162 }, -- Mikehe's note
        [16] = { cost = 200, id = 6163 }, -- Sonia's diary
        [17] = { cost = 200, id = 6164 }, -- The Successor
        [18] = { cost = 200, id = 6165 }, -- Kagetora's journal
        [19] = { cost = 200, id = 6166 }, -- Altana's Hymn
        [20] = { cost = 200, id = 6167 }, -- Coveffe Barrows musings
        [21] = { cost = 200, id = 6168 }, -- Aid for All
        [22] = { cost = 200, id = 6169 }, -- Investigative report
        [23] = { cost = 200, id = 6170 }, -- Bounty list
        [24] = { cost = 200, id = 6171 }, -- Dark Deeds
        [25] = { cost = 200, id = 6172 }, -- Breezy Libretto
        [26] = { cost = 200, id = 6173 }, -- Cavernous score
        [27] = { cost = 200, id = 6174 }, -- Beaming score
        [28] = { cost = 200, id = 6175 }, -- Yomi's diagram
        [29] = { cost = 200, id = 6176 }, -- Astral Homeland
        [30] = { cost = 200, id = 6177 }, -- Life-form Study
        [31] = { cost = 200, id = 6178 }, -- Hrohj's record
        [32] = { cost = 200, id = 6179 }, -- The Bell Tolls
    },
    [3] = { -- Equipment (Lv.1 - 9)
        [ 0] = { cost = 50, id = 16385, lv = 1 }, -- Cesti
        [ 1] = { cost = 50, id = 16390, lv = 5 }, -- Bronze knuckles
        [ 2] = { cost = 50, id = 16391, lv = 9 }, -- Brass knuckles
        [ 3] = { cost = 50, id = 16448, lv = 1 }, -- Bronze dagger
        [ 4] = { cost = 50, id = 16465, lv = 1 }, -- Bronze knife
        [ 5] = { cost = 50, id = 16454, lv = 7 }, -- Blind dagger
        [ 6] = { cost = 50, id = 16471, lv = 7 }, -- Blind knife
        [ 7] = { cost = 50, id = 16449, lv = 9 }, -- Brass dagger
        [ 8] = { cost = 50, id = 16600, lv = 1 }, -- Wax sword
        [ 9] = { cost = 50, id = 16530, lv = 7 }, -- Xiphos
        [10] = { cost = 50, id = 16640, lv = 1 }, -- Bronze axe
        [11] = { cost = 50, id = 16641, lv = 8 }, -- Brass axe
        [12] = { cost = 50, id = 16704, lv = 5 }, -- Butterfly axe
        [13] = { cost = 50, id = 16709, lv = 8 }, -- Inferno axe
        [14] = { cost = 50, id = 16768, lv = 1 }, -- Bronze zaghnal
        [15] = { cost = 50, id = 16832, lv = 1 }, -- Harpoon
        [16] = { cost = 50, id = 16833, lv = 7 }, -- Bronze spear
        [17] = { cost = 50, id = 16896, lv = 1 }, -- Kunai
        [18] = { cost = 50, id = 16900, lv = 7 }, -- Wakizashi
        [19] = { cost = 50, id = 16966, lv = 8 }, -- Tachi
        [20] = { cost = 50, id = 17024, lv = 1 }, -- Ash club
        [21] = { cost = 50, id = 17034, lv = 4 }, -- Bronze mace
        [22] = { cost = 50, id = 17042, lv = 5 }, -- Bronze hammer
        [23] = { cost = 50, id = 17059, lv = 5 }, -- Bronze rod
        [24] = { cost = 50, id = 17050, lv = 9 }, -- Willow wand
        [25] = { cost = 50, id = 17088, lv = 1 }, -- Ash staff
        [26] = { cost = 50, id = 17095, lv = 5 }, -- Ash pole
        [27] = { cost = 50, id = 17152, lv = 1 }, -- Shortbow
        [28] = { cost = 50, id = 17160, lv = 5 }, -- Longbow
        [29] = { cost = 50, id = 17153, lv = 7 }, -- Self bow
        [30] = { cost = 50, id = 17216, lv = 1 }, -- Light crossbow
        [31] = { cost = 50, id = 19224, lv = 6 }, -- Musketoon
        [32] = { cost = 50, id = 17345, lv = 1 }, -- Flute
        [33] = { cost = 50, id = 17344, lv = 4 }, -- Cornette
        [34] = { cost = 50, id = 17347, lv = 9 }, -- Piccolo
        [35] = { cost = 50, id = 17353, lv = 1 }, -- Maple harp
        [36] = { cost = 50, id = 12448, lv = 1 }, -- Bronze cap
        [37] = { cost = 50, id = 12576, lv = 1 }, -- Bronze harness
        [38] = { cost = 50, id = 12704, lv = 1 }, -- Bronze mittens
        [39] = { cost = 50, id = 12832, lv = 1 }, -- Bronze subligar
        [40] = { cost = 50, id = 12960, lv = 1 }, -- Bronze Leggings
        [41] = { cost = 50, id = 12472, lv = 1 }, -- Circlet
        [42] = { cost = 50, id = 12600, lv = 1 }, -- Robe
        [43] = { cost = 50, id = 12728, lv = 1 }, -- Cuffs
        [44] = { cost = 50, id = 12856, lv = 1 }, -- Slops
        [45] = { cost = 50, id = 12984, lv = 1 }, -- Ash clogs
        [46] = { cost = 50, id = 12440, lv = 7 }, -- Leather bandana
        [47] = { cost = 50, id = 12568, lv = 7 }, -- Leather vest
        [48] = { cost = 50, id = 12696, lv = 7 }, -- Leather gloves
        [49] = { cost = 50, id = 12824, lv = 7 }, -- Leather trousers
        [50] = { cost = 50, id = 12952, lv = 7 }, -- Leather highboots
        [51] = { cost = 50, id = 12608, lv = 8 }, -- Tunic
        [52] = { cost = 50, id = 12736, lv = 8 }, -- Mitts
        [53] = { cost = 50, id = 12864, lv = 8 }, -- Slacks
        [54] = { cost = 50, id = 12992, lv = 8 }, -- Solea
        [55] = { cost = 50, id = 12456, lv = 8 }, -- Hachimaki
        [56] = { cost = 50, id = 12584, lv = 8 }, -- Kenpogi
        [57] = { cost = 50, id = 12712, lv = 8 }, -- Tekko
        [58] = { cost = 50, id = 12840, lv = 8 }, -- Sitabaki
        [59] = { cost = 50, id = 12968, lv = 8 }, -- Kyahan
        [60] = { cost = 50, id = 12289, lv = 1 }, -- Lauan shield
        [61] = { cost = 50, id = 12415, lv = 7 }, -- Shell shield
        [62] = { cost = 50, id = 12290, lv = 8 }, -- Maple shield
        [63] = { cost = 50, id = 12299, lv = 9 }, -- Aspis
    },
    [4] = { -- Equipment (Lv.10 - 19)
        [ 0] = { cost =  60, id = 16407, lv = 11 }, -- Brass baghnakhs
        [ 1] = { cost =  60, id = 16450, lv = 12 }, -- Dagger
        [ 2] = { cost =  60, id = 16466, lv = 13 }, -- Knife
        [ 3] = { cost =  80, id = 16455, lv = 18 }, -- Baselard
        [ 4] = { cost =  70, id = 16572, lv = 11 }, -- Bee spatha
        [ 5] = { cost =  80, id = 16531, lv = 13 }, -- Brass xiphos
        [ 6] = { cost = 132, id = 16536, lv = 18 }, -- Iron sword
        [ 7] = { cost =  60, id = 16583, lv = 10 }, -- Claymore
        [ 8] = { cost =  98, id = 16588, lv = 13 }, -- Flame Claymore
        [ 9] = { cost =  93, id = 16642, lv = 13 }, -- Bone axe
        [10] = { cost =  60, id = 16649, lv = 16 }, -- Bone pick
        [11] = { cost =  91, id = 16705, lv = 12 }, -- Greataxe
        [12] = { cost =  60, id = 16769, lv = 10 }, -- Brass zaghnal
        [13] = { cost = 177, id = 16774, lv = 18 }, -- Scythe
        [14] = { cost =  60, id = 16834, lv = 14 }, -- Brass spear
        [15] = { cost =  60, id = 18076, lv = 14 }, -- Spark spear
        [16] = { cost =  93, id = 16919, lv = 13 }, -- Shinobi-gatana
        [17] = { cost =  89, id = 16906, lv = 16 }, -- Mokuto
        [18] = { cost =  68, id = 16960, lv = 12 }, -- Uchigatana
        [19] = { cost = 135, id = 16982, lv = 16 }, -- Nodachi
        [20] = { cost =  60, id = 17043, lv = 12 }, -- Brass hammer
        [21] = { cost =  60, id = 17081, lv = 12 }, -- Brass rod
        [22] = { cost =  60, id = 17025, lv = 16 }, -- Chestnut club
        [23] = { cost =  60, id = 17051, lv = 18 }, -- Yew wand
        [24] = { cost =  81, id = 17035, lv = 19 }, -- Mace
        [25] = { cost =  60, id = 17089, lv = 11 }, -- Holly staff
        [26] = { cost =  60, id = 17096, lv = 16 }, -- Holly pole
        [27] = { cost =  99, id = 17161, lv = 16 }, -- Power bow
        [28] = { cost =  60, id = 17217, lv = 12 }, -- Crossbow
        [29] = { cost = 200, id = 17257, lv = 15 }, -- Bandit's gun
        [30] = { cost = 187, id = 17265, lv = 19 }, -- Tanegashima
        [31] = { cost =  86, id = 17351, lv = 19 }, -- Gemshorn
        [32] = { cost =  60, id = 17354, lv = 14 }, -- Harp
        [33] = { cost =  60, id = 12432, lv = 10 }, -- Faceguard
        [34] = { cost =  60, id = 12560, lv = 10 }, -- Scale mail
        [35] = { cost =  60, id = 12688, lv = 10 }, -- Scale finger gauntlets
        [36] = { cost =  60, id = 12816, lv = 10 }, -- Scale cuisses
        [37] = { cost =  60, id = 12944, lv = 10 }, -- Scale greaves
        [38] = { cost =  60, id = 12464, lv = 11 }, -- Headgear
        [39] = { cost =  60, id = 12592, lv = 11 }, -- Doublet
        [40] = { cost =  60, id = 12720, lv = 11 }, -- Gloves
        [41] = { cost =  60, id = 12848, lv = 11 }, -- Brais
        [42] = { cost =  60, id = 12976, lv = 11 }, -- Gaiters
        [43] = { cost =  65, id = 12454, lv = 16 }, -- Bone mask
        [44] = { cost =  60, id = 12582, lv = 16 }, -- Bone Harness
        [45] = { cost =  60, id = 12710, lv = 16 }, -- Bone mittens
        [46] = { cost =  60, id = 12834, lv = 16 }, -- Bone Subligar
        [47] = { cost =  60, id = 12966, lv = 16 }, -- Bone Leggings
        [48] = { cost =  60, id = 12441, lv = 17 }, -- Lizard helm
        [49] = { cost =  60, id = 12569, lv = 17 }, -- Lizard jerkin
        [50] = { cost =  60, id = 12697, lv = 17 }, -- Lizard gloves
        [51] = { cost =  60, id = 12825, lv = 17 }, -- Lizard trousers
        [52] = { cost =  60, id = 12953, lv = 17 }, -- Lizard Ledelsens
        [53] = { cost =  60, id = 12291, lv = 13 }, -- Elm shield
    },
    [5] = { -- Equipment (Lv.20 - 29)
        [ 0] = { cost =  87, id = 16392, lv = 20 }, -- Metal knuckles
        [ 1] = { cost = 144, id = 16406, lv = 24 }, -- Baghnakhs
        [ 2] = { cost =  99, id = 16387, lv = 27 }, -- Poison cesti
        [ 3] = { cost = 103, id = 16473, lv = 20 }, -- Kukri
        [ 4] = { cost =  96, id = 16496, lv = 20 }, -- Poison dagger
        [ 5] = { cost = 123, id = 16472, lv = 21 }, -- Poison knife
        [ 6] = { cost = 143, id = 16451, lv = 23 }, -- Mythril dagger
        [ 7] = { cost = 170, id = 16517, lv = 20 }, -- Degen
        [ 8] = { cost = 215, id = 16513, lv = 23 }, -- Tuck
        [ 9] = { cost = 269, id = 16532, lv = 27 }, -- Gladius
        [10] = { cost =  70, id = 16593, lv = 20 }, -- Plain sword
        [11] = { cost = 349, id = 16594, lv = 27 }, -- Inferno sword
        [12] = { cost = 136, id = 16643, lv = 20 }, -- Battleaxe
        [13] = { cost =  83, id = 17942, lv = 25 }, -- Tomahawk
        [14] = { cost = 209, id = 16770, lv = 20 }, -- Zaghnal
        [15] = { cost =  84, id = 16835, lv = 24 }, -- Spear
        [16] = { cost = 103, id = 17776, lv = 24 }, -- Hibari
        [17] = { cost = 120, id = 16907, lv = 26 }, -- Busuto
        [18] = { cost = 109, id = 17044, lv = 20 }, -- Warhammer
        [19] = { cost =  70, id = 17090, lv = 23 }, -- Elm staff
        [20] = { cost =  70, id = 17424, lv = 25 }, -- Spiked club
        [21] = { cost = 132, id = 17154, lv = 24 }, -- Wrapped bow
        [22] = { cost = 520, id = 17248, lv = 22 }, -- Arquebus
        [23] = { cost = 432, id = 17259, lv = 27 }, -- Pirate's gun
        [24] = { cost =  70, id = 15207, lv = 20 }, -- Trader's chapeau
        [25] = { cost =  71, id = 14446, lv = 20 }, -- Trader's saio
        [26] = { cost =  70, id = 14053, lv = 20 }, -- Trader's cuffs
        [27] = { cost =  70, id = 15404, lv = 20 }, -- Trader's slops
        [28] = { cost =  70, id = 15343, lv = 20 }, -- Trader's pigaches
        [29] = { cost = 171, id = 12424, lv = 24 }, -- Iron mask
        [30] = { cost = 264, id = 12552, lv = 24 }, -- Chainmail
        [31] = { cost = 141, id = 12680, lv = 24 }, -- Chain mittens
        [32] = { cost = 210, id = 12808, lv = 24 }, -- Chain hose
        [33] = { cost = 129, id = 12936, lv = 24 }, -- Greaves
        [34] = { cost = 195, id = 15165, lv = 25 }, -- Shade tiara
        [35] = { cost = 525, id = 14426, lv = 25 }, -- Shade harness
        [36] = { cost = 301, id = 14858, lv = 25 }, -- Shade mittens
        [37] = { cost = 354, id = 14327, lv = 25 }, -- Shade tights
        [38] = { cost = 379, id = 15315, lv = 25 }, -- Shade leggings
        [39] = { cost = 250, id = 15167, lv = 29 }, -- Eisenschaller
        [40] = { cost = 250, id = 14431, lv = 29 }, -- Eisenbrust
        [41] = { cost = 170, id = 14860, lv = 29 }, -- Eisenhentzes
        [42] = { cost = 140, id = 14329, lv = 29 }, -- Eisendiechlings
        [43] = { cost = 290, id = 15317, lv = 29 }, -- Eisenschuhs
        [44] = { cost =  70, id = 15163, lv = 29 }, -- Seer's crown
        [45] = { cost = 234, id = 14424, lv = 29 }, -- Seer's tunic
        [46] = { cost =  97, id = 14856, lv = 29 }, -- Seer's mitts
        [47] = { cost = 137, id = 14325, lv = 29 }, -- Seer's slacks
        [48] = { cost = 157, id = 15313, lv = 29 }, -- Seer's pumps
        [49] = { cost =  83, id = 12292, lv = 20 }, -- Mahogany shield
        [50] = { cost =  70, id = 12414, lv = 24 }, -- Turtle shield
        [51] = { cost = 153, id = 12306, lv = 28 }, -- Kite shield
    },
    [6] = { -- Equipment (Lv.30 - 39)
        [ 0] = { cost = 182, id = 16411, lv = 30 }, -- Claws
        [ 1] = { cost = 194, id = 16399, lv = 33 }, -- Katars
        [ 2] = { cost = 230, id = 16393, lv = 38 }, -- Mythril Knuckles
        [ 3] = { cost = 317, id = 19105, lv = 30 }, -- Thug's jambiya
        [ 4] = { cost = 248, id = 16475, lv = 34 }, -- Mythril kukri
        [ 5] = { cost = 198, id = 16456, lv = 36 }, -- Mythril baselard
        [ 6] = { cost = 334, id = 16545, lv = 30 }, -- Broadsword
        [ 7] = { cost = 497, id = 16576, lv = 34 }, -- Hunting sword
        [ 8] = { cost = 430, id = 16581, lv = 36 }, -- Holy sword
        [ 9] = { cost = 493, id = 16549, lv = 38 }, -- Divine sword
        [10] = { cost = 532, id = 18375, lv = 33 }, -- Falx
        [11] = { cost = 525, id = 16584, lv = 36 }, -- Mythril claymore
        [12] = { cost =  80, id = 17955, lv = 31 }, -- Plain pick
        [13] = { cost = 540, id = 16644, lv = 37 }, -- Mythril axe
        [14] = { cost = 297, id = 18214, lv = 31 }, -- Voulge
        [15] = { cost = 515, id = 16706, lv = 34 }, -- Heavy axe
        [16] = { cost = 154, id = 16845, lv = 34 }, -- Lance
        [17] = { cost = 144, id = 18078, lv = 34 }, -- Spark lance
        [18] = { cost = 135, id = 16836, lv = 36 }, -- Halberd
        [19] = { cost = 130, id = 18122, lv = 38 }, -- Broach lance
        [20] = { cost = 168, id = 16901, lv = 32 }, -- Kodachi
        [21] = { cost = 230, id = 16973, lv = 34 }, -- Homura
        [22] = { cost = 325, id = 16962, lv = 36 }, -- Ashura
        [23] = { cost = 324, id = 16970, lv = 37 }, -- Hosodachi
        [24] = { cost = 228, id = 17045, lv = 31 }, -- Maul
        [25] = { cost =  80, id = 17052, lv = 32 }, -- Chestnut wand
        [26] = { cost =  80, id = 17061, lv = 34 }, -- Mythril rod
        [27] = { cost = 226, id = 17036, lv = 35 }, -- Mythril mace
        [28] = { cost = 319, id = 17080, lv = 38 }, -- Holy maul
        [29] = { cost =  80, id = 17097, lv = 30 }, -- Elm pole
        [30] = { cost = 122, id = 17091, lv = 39 }, -- Oak staff
        [31] = { cost = 312, id = 17162, lv = 30 }, -- Great bow
        [32] = { cost = 125, id = 17155, lv = 36 }, -- Composite bow
        [33] = { cost = 171, id = 17218, lv = 30 }, -- Zamburak
        [34] = { cost = 340, id = 18715, lv = 30 }, -- Mars's hexagun
        [35] = { cost = 185, id = 18704, lv = 36 }, -- Darksteel hexagun
        [36] = { cost = 210, id = 17348, lv = 32 }, -- Traversiere
        [37] = { cost = 250, id = 17355, lv = 36 }, -- Rose harp
        [38] = { cost =  80, id = 15164, lv = 30 }, -- Garish crown
        [39] = { cost = 265, id = 14425, lv = 30 }, -- Garish tunic
        [40] = { cost =  84, id = 14857, lv = 30 }, -- Garish mitts
        [41] = { cost = 190, id = 14326, lv = 30 }, -- Garish slacks
        [42] = { cost = 124, id = 15314, lv = 30 }, -- Garish pumps
        [43] = { cost =  80, id = 15161, lv = 30 }, -- Noct beret
        [44] = { cost = 198, id = 14422, lv = 30 }, -- Noct doublet
        [45] = { cost = 136, id = 14854, lv = 30 }, -- Noct gloves
        [46] = { cost = 135, id = 14323, lv = 30 }, -- Noct brais
        [47] = { cost = 192, id = 15311, lv = 30 }, -- Noct gaiters
        [48] = { cost = 174, id = 12610, lv = 34 }, -- Cloak
        [49] = { cost =  82, id = 12738, lv = 34 }, -- Linen mitts
        [50] = { cost = 188, id = 12866, lv = 34 }, -- Linen slacks
        [51] = { cost = 110, id = 12994, lv = 34 }, -- Shoes
        [52] = { cost =  85, id = 12450, lv = 35 }, -- Padded cap
        [53] = { cost = 393, id = 12578, lv = 35 }, -- Padded armor
        [54] = { cost = 216, id = 12706, lv = 35 }, -- Iron mittens
        [55] = { cost = 316, id = 12836, lv = 35 }, -- Iron subligar
        [56] = { cost = 196, id = 12962, lv = 35 }, -- Leggings
        [57] = { cost = 125, id = 12466, lv = 36 }, -- Red cap
        [58] = { cost = 250, id = 12594, lv = 36 }, -- Gambison
        [59] = { cost =  80, id = 12722, lv = 36 }, -- Bracers
        [60] = { cost = 175, id = 12850, lv = 36 }, -- Hose
        [61] = { cost = 200, id = 12978, lv = 36 }, -- Socks
        [62] = { cost = 285, id = 12475, lv = 38 }, -- Velvet hat
        [63] = { cost = 425, id = 12603, lv = 38 }, -- Velvet robe
        [64] = { cost = 240, id = 12731, lv = 38 }, -- Velvet cuffs
        [65] = { cost = 347, id = 12859, lv = 38 }, -- Velvet slops
        [66] = { cost = 134, id = 12987, lv = 38 }, -- Ebony sabots
        [67] = { cost = 302, id = 13871, lv = 37 }, -- Iron visor
        [68] = { cost = 464, id = 13783, lv = 37 }, -- Iron scale mail
        [69] = { cost = 248, id = 14001, lv = 37 }, -- Iron finger gauntlets
        [70] = { cost = 226, id = 14118, lv = 37 }, -- Iron greaves
        [71] = { cost =  80, id = 12300, lv = 31 }, -- Targe
        [72] = { cost = 195, id = 12293, lv = 36 }, -- Oak shield
        [73] = { cost = 256, id = 12364, lv = 39 }, -- Nymph shield
    },
    [7] = { -- Equipment (Lv.40 - 50)
        [ 0] = { cost =  114, id = 16388 }, -- Himantes
        [ 1] = { cost =  298, id = 16412 }, -- Mythril claws
        [ 2] = { cost =  416, id = 16419 }, -- Patas
        [ 3] = { cost =  372, id = 16459 }, -- Acid baselard
        [ 4] = { cost =   90, id = 17610 }, -- Bone knife
        [ 5] = { cost =  480, id = 16522 }, -- Flame degen
        [ 6] = { cost =  680, id = 16558 }, -- Falchion
        [ 7] = { cost =  775, id = 16564 }, -- Flame blade
        [ 8] = { cost =  775, id = 16567 }, -- Knight's sword
        [ 9] = { cost =  676, id = 16590 }, -- Greatsword
        [10] = { cost =  669, id = 16957 }, -- Faussar
        [11] = { cost =  660, id = 16657 }, -- Tabar
        [12] = { cost =  740, id = 16651 }, -- Mythril pick
        [13] = { cost =  481, id = 18207 }, -- Kheten
        [14] = { cost =  690, id = 16775 }, -- Mythril scythe
        [15] = { cost =  698, id = 16796 }, -- Mythril zaghnal
        [16] = { cost = 1017, id = 18050 }, -- Mandibular sickle
        [17] = { cost =  258, id = 16847 }, -- Mythril lance
        [18] = { cost =  124, id = 16905 }, -- Bokuto
        [19] = { cost =  231, id = 16902 }, -- Sakurafubuki
        [20] = { cost =  120, id = 16908 }, -- Yoto
        [21] = { cost =  233, id = 16915 }, -- Hien
        [22] = { cost =  374, id = 16967 }, -- Mikazuki
        [23] = { cost =  112, id = 17062 }, -- Bone rod
        [24] = { cost =  136, id = 17053 }, -- Rose wand
        [25] = { cost =  156, id = 17098 }, -- Oak pole
        [26] = { cost =  105, id = 17523 }, -- Quarterstaff
        [27] = { cost =  360, id = 17163 }, -- Battle bow
        [28] = { cost =  247, id = 17156 }, -- Kaman
        [29] = { cost =  408, id = 17164 }, -- War bow
        [30] = { cost = 1200, id = 17267 }, -- Negoroshiki
        [31] = { cost =  255, id = 17219 }, -- Arbalest
        [32] = { cost =  308, id = 18710 }, -- Seadog gun
        [33] = { cost =   90, id = 17352 }, -- Horn
        [34] = { cost =  120, id = 17350 }, -- Angel's flute
        [35] = { cost =  414, id = 14243 }, -- Iron cuisses (random pants?)
        [36] = { cost =  354, id = 12416 }, -- Sallet
        [37] = { cost =  546, id = 12544 }, -- Breastplate
        [38] = { cost =  288, id = 12672 }, -- Gauntlets
        [39] = { cost =  180, id = 12800 }, -- Cuisses
        [40] = { cost =  264, id = 12928 }, -- Plate leggings
        [41] = { cost =  750, id = 15205 }, -- Alumine salade
        [42] = { cost = 1620, id = 14444 }, -- Alumine haubert
        [43] = { cost =  540, id = 14051 }, -- Alumine moufles
        [44] = { cost =  654, id = 15402 }, -- Alumine brayettes
        [45] = { cost =  534, id = 15341 }, -- Alumine sollerets
        [46] = { cost =  427, id = 12426 }, -- Banded helm
        [47] = { cost =  660, id = 12554 }, -- Banded mail
        [48] = { cost =  352, id = 12682 }, -- Mufflers
        [49] = { cost =  525, id = 12810 }, -- Breeches
        [50] = { cost =  322, id = 12938 }, -- Sollerets
        [51] = { cost =  224, id = 12444 }, -- Raptor helm
        [52] = { cost =  152, id = 12572 }, -- Raptor jerkin
        [53] = { cost =  360, id = 12700 }, -- Raptor gloves
        [54] = { cost =  216, id = 12828 }, -- Raptor trousers
        [55] = { cost =  336, id = 12956 }, -- Raptor ledelsens
        [56] = { cost =  437, id = 12417 }, -- Mythril sallet
        [57] = { cost =  750, id = 12545 }, -- Mythril breastplate
        [58] = { cost =  396, id = 12673 }, -- Mythril gauntlets
        [59] = { cost =  354, id = 12801 }, -- Mythril cuisses
        [60] = { cost =  363, id = 12929 }, -- Mythril leggings
        [61] = { cost =  437, id = 12460 }, -- Shinobi hachigane
        [62] = { cost =  660, id = 12588 }, -- Shinobi gi
        [63] = { cost =  363, id = 12716 }, -- Shinobi tekko
        [64] = { cost =  346, id = 12844 }, -- Shinobi hakama
        [65] = { cost =  338, id = 12972 }, -- Shinobi kyahan
        [66] = { cost =  448, id = 13873 }, -- Steel visor
        [67] = { cost =  688, id = 13785 }, -- Steel scale mail
        [68] = { cost =  368, id = 14003 }, -- Steel finger gauntlets
        [69] = { cost =  586, id = 14245 }, -- Steel cuisses
        [70] = { cost =  325, id = 14120 }, -- Steel greaves
        [71] = { cost =  210, id = 15242 }, -- Crow beret
        [72] = { cost =  308, id = 14498 }, -- Crow jupon
        [73] = { cost =  182, id = 14907 }, -- Crow bracers
        [74] = { cost =  287, id = 15578 }, -- Crow hose
        [75] = { cost =  385, id = 15663 }, -- Crow gaiters
        [76] = { cost =  316, id = 12307 }, -- Heater shield
        [77] = { cost =  311, id = 12301 }, -- Buckler
        [78] = { cost =  128, id = 12294 }, -- Leather shield
    },
    [8] = { -- Equipment (Lv.51 - 70)
        [ 0] = { cost =  389, id = 16394 }, -- Darksteel knuckles
        [ 1] = { cost =  484, id = 16400 }, -- Darksteel katars
        [ 2] = { cost =  362, id = 16422 }, -- Tigerfangs
        [ 3] = { cost =  200, id = 17612 }, -- Beetle knife
        [ 4] = { cost =  891, id = 16477 }, -- Cermet kukri
        [ 5] = { cost =  752, id = 16538 }, -- Darksteel sword
        [ 6] = { cost = 1018, id = 16554 }, -- Hanger
        [ 7] = { cost =  303, id = 16514 }, -- Mailbreaker
        [ 8] = { cost = 1354, id = 16541 }, -- Jagdplaute
        [ 9] = { cost =  997, id = 16585 }, -- Darksteel claymore
        [10] = { cost = 1485, id = 16596 }, -- Flamberge
        [11] = { cost = 1025, id = 16645 }, -- Darksteel axe
        [12] = { cost =  556, id = 16653 }, -- Nadziak
        [13] = { cost = 1155, id = 16730 }, -- Colossal axe
        [14] = { cost =  200, id = 16794 }, -- Bone scythe
        [15] = { cost = 1253, id = 16789 }, -- Darksteel scythe
        [16] = { cost =  735, id = 16888 }, -- Battle fork
        [17] = { cost =  483, id = 16848 }, -- Darksteel lance
        [18] = { cost =  482, id = 18093 }, -- Couse
        [19] = { cost =  546, id = 16842 }, -- Golden spear
        [20] = { cost =  402, id = 16903 }, -- Kabutowari
        [21] = { cost =  260, id = 16909 }, -- Kororito
        [22] = { cost =  632, id = 16964 }, -- Zanbato
        [23] = { cost =  795, id = 16972 }, -- Kazaridachi
        [24] = { cost =  200, id = 17054 }, -- Ebony wand
        [25] = { cost =  284, id = 17056 }, -- Mythic wand
        [26] = { cost =  435, id = 17100 }, -- Ebony pole
        [27] = { cost =  623, id = 17236 }, -- Leo crossbow
        [28] = { cost =  517, id = 17220 }, -- Heavy crossbow
        [29] = { cost =  533, id = 17242 }, -- Velocity bow
        [30] = { cost =  200, id = 17361 }, -- Crumhorn
        [31] = { cost =  200, id = 17849 }, -- Hellish bugle
        [32] = { cost =  700, id = 17359 }, -- Mythic harp
        [33] = { cost =  456, id = 12323 }, -- Scutum
        [34] = { cost =  200, id = 12311 }, -- Hoplon
        [35] = { cost =  825, id = 16170 }, -- Wivre shield
        [36] = { cost =  473, id = 12302 }, -- Darksteel buckler
        [37] = { cost =  540, id = 12308 }, -- Darksteel shield
        [38] = { cost =  281, id = 12295 }, -- Round shield
        [39] = { cost =  408, id = 12303 }, -- Gold buckler
        [40] = { cost =  395, id = 12324 }, -- Tower shield
        [41] = { cost =  560, id = 12310 }, -- Diamond shield
        [42] = { cost = 1560, id = 12383 }, -- General's shield
        [43] = { cost =  204, id = 12359 }, -- Hickory shield
    },
    [9] = { -- Equipment (Lv.71 - 98)
        [ 0] = { cost = 1033, id = 16423, lv = 75 }, -- Manoples
        [ 1] = { cost =  300, id = 18782, lv = 87 }, -- Eyra baghnakhs
        [ 2] = { cost =  300, id = 16470, lv = 72 }, -- Gully
        [ 3] = { cost =  687, id = 16485, lv = 77 }, -- Yataghan
        [ 4] = { cost =  687, id = 19138, lv = 87 }, -- Verus knife
        [ 5] = { cost =  687, id = 17664, lv = 77 }, -- Firmament
        [ 6] = { cost =  852, id = 18901, lv = 87 }, -- Falcata
        [ 7] = { cost = 1625, id = 19151, lv = 73 }, -- Bahadur
        [ 8] = { cost =  687, id = 19165, lv = 77 }, -- Cratus sword
        [ 9] = { cost =  866, id = 19170, lv = 87 }, -- Kardia faussar
        [10] = { cost =  694, id = 16660, lv = 77 }, -- Doom tabar
        [11] = { cost =  701, id = 18537, lv = 87 }, -- Maiden tabar
        [12] = { cost =  790, id = 16707, lv = 71 }, -- Bhuj
        [13] = { cost =  687, id = 18511, lv = 77 }, -- Dolor bhuj
        [14] = { cost =  687, id = 18517, lv = 87 }, -- Elephas axe
        [15] = { cost =  675, id = 16777, lv = 73 }, -- Death scythe
        [16] = { cost =  687, id = 18964, lv = 77 }, -- Dire scythe
        [17] = { cost =  762, id = 18555, lv = 87 }, -- Sectum sickle
        [18] = { cost =  795, id = 16840, lv = 71 }, -- Ox tongue
        [19] = { cost =  300, id = 16861, lv = 74 }, -- Ice lance
        [20] = { cost =  391, id = 19317, lv = 87 }, -- Borian spear
        [21] = { cost =  926, id = 18420, lv = 71 }, -- Hayabusa
        [22] = { cost =  687, id = 19285, lv = 77 }, -- Kakko
        [23] = { cost =  561, id = 19293, lv = 87 }, -- Ichi-an
        [24] = { cost =  701, id = 16971, lv = 77 }, -- Yukitsugu
        [25] = { cost =  391, id = 16963, lv = 87 }, -- Taimakuniyuki
        [26] = { cost =  300, id = 18848, lv = 71 }, -- Brass jadagna
        [27] = { cost =  687, id = 18875, lv = 77 }, -- Vodun mace
        [28] = { cost =  302, id = 18877, lv = 87 }, -- Robur mace
        [29] = { cost =  300, id = 17102, lv = 75 }, -- Eight-sided pole
        [30] = { cost =  708, id = 18621, lv = 87 }, -- Warmage's pole
        [31] = { cost =  516, id = 18695, lv = 75 }, -- Cerberus bow
        [32] = { cost =  361, id = 19733, lv = 87 }, -- Beursault bow
        [33] = { cost =  808, id = 17252, lv = 73 }, -- Culverin
        [34] = { cost =  650, id = 17213, lv = 74 }, -- Staurobow
        [35] = { cost =  687, id = 19265, lv = 77 }, -- Darkwing
        [36] = { cost =  687, id = 19267, lv = 77 }, -- Ribauldequin
        [37] = { cost =  656, id = 19735, lv = 87 }, -- Cecchino's fucile
        [38] = { cost =  644, id = 12309, lv = 71 }, -- Ritter shield
        [39] = { cost =  556, id = 12305, lv = 72 }, -- Ice shield
        [40] = { cost = 2231, id = 12387, lv = 73 }, -- Koenig shield
        [41] = { cost = 2755, id = 12385, lv = 75 }, -- Acheron shield
        [42] = { cost =  300, id = 16189, lv = 80 }, -- Gleaming shield
    },
--[[
    [10] = { -- Equipment (Lv.99)
        [ 0] = { cost =  3000, id = 27740 }, -- Outrider mask
        [ 1] = { cost =  5000, id = 27881 }, -- Outrider mail
        [ 2] = { cost =  3000, id = 28029 }, -- Outrider mittens
        [ 3] = { cost =  3000, id = 28168 }, -- Outrider hose
        [ 4] = { cost =  3000, id = 28306 }, -- Outrider greaves
        [ 5] = { cost =  3000, id = 27741 }, -- Espial cap
        [ 6] = { cost =  5000, id = 27882 }, -- Espial Gambison
        [ 7] = { cost =  3000, id = 28030 }, -- Espial bracers
        [ 8] = { cost =  3000, id = 28169 }, -- Espial hose
        [ 9] = { cost =  3000, id = 28307 }, -- Espial socks
        [10] = { cost =  3000, id = 27742 }, -- Wayfarer circlet
        [11] = { cost =  5000, id = 27883 }, -- Wayfarer robe
        [12] = { cost =  3000, id = 28031 }, -- Wayfarer cuffs
        [13] = { cost =  3000, id = 28170 }, -- Wayfarer slops
        [14] = { cost =  3000, id = 28308 }, -- Wayfarer clogs
        [15] = { cost =  2000, id = 27743 }, -- Temachtiani headband
        [16] = { cost =  3000, id = 27884 }, -- Temachtiani shirt
        [17] = { cost =  2000, id = 28032 }, -- Temachtiani gloves
        [18] = { cost =  2000, id = 28171 }, -- Temachtiani pants
        [19] = { cost =  2000, id = 28309 }, -- Temachtiani boots
        [20] = { cost =  7000, id = 20540 }, -- Eminent baghnakhs
        [21] = { cost =  7000, id = 20624 }, -- Eminent dagger
        [22] = { cost =  7000, id = 20726 }, -- Eminent scimitar
        [23] = { cost =  7000, id = 20766 }, -- Eminent sword
        [24] = { cost =  7000, id = 20817 }, -- Eminent axe
        [25] = { cost =  7000, id = 20865 }, -- Eminent voulge
        [26] = { cost =  7000, id = 20908 }, -- Eminent sickle
        [27] = { cost =  7000, id = 20954 }, -- Eminent lance
        [28] = { cost =  7000, id = 20998 }, -- Kaitsuburi
        [29] = { cost =  7000, id = 21044 }, -- Ichimonji-Yofusa
        [30] = { cost =  7000, id = 21119 }, -- Eminent wand
        [31] = { cost =  7000, id = 21182 }, -- Eminent staff
        [32] = { cost =  7000, id = 21183 }, -- Eminent pole
        [33] = { cost =  7000, id = 21231 }, -- Eminent bow
        [34] = { cost =  7000, id = 21251 }, -- Eminent crossbow
        [35] = { cost =  7000, id = 21281 }, -- Eminent gun
        [36] = { cost =  7000, id = 28656 }, -- Eminent shield
        [37] = { cost =  7000, id = 21453 }, -- Eminent animator
        [38] = { cost =  7000, id = 21383 }, -- Eminent sachet
        [39] = { cost = 10000, id = 28549 }, -- Enlivened ring
        [40] = { cost = 10000, id = 28550 }, -- Vehemence ring
        [41] = { cost = 10000, id = 28551 }, -- Longshot ring
        [42] = { cost = 10000, id = 28552 }, -- Fistmele ring
        [43] = { cost = 10000, id = 28553 }, -- Perception ring
        [44] = { cost = 10000, id = 28554 }, -- Acumen ring
        [45] = { cost = 10000, id = 28499 }, -- Influx earring
        [46] = { cost = 10000, id = 28500 }, -- Upsurge earring
        [47] = { cost = 10000, id = 28501 }, -- Allegro earring
        [48] = { cost = 10000, id = 28502 }, -- Impregnable earring
        [49] = { cost = 10000, id = 28503 }, -- Flashward earring
        [50] = { cost = 10000, id = 28504 }, -- Spellbreaker earring
        [51] = { cost = 10000, id = 28547 }, -- Merirosvo ring
        [52] = { cost = 10000, id = 21462 }, -- Eminent bell
        [53] = { cost = 10000, id = 21405 }, -- Eminent flute
        [54] = { cost =  5000, id = 21302 }, -- Eminent arrow
        [55] = { cost =  5000, id = 21316 }, -- Eminent bolt
        [56] = { cost =  5000, id = 21331 }, -- Eminent bullet
        [57] = { cost =  7000, id = 21355 }, -- Hachiya shuriken
        [58] = { cost =  7000, id = 22260 }, -- Eminent animator II
    },
    [12] = { -- Alter Ego Extravaganza Trusts
        [10133] = { cost =  500, id = xi.items.CIPHER_OF_F_COFFINS_ALTER_EGO }, -- F. Coffin
        [10138] = { cost =  500, id = xi.items.CIPHER_OF_CIDS_ALTER_EGO }, -- Cid
        [10148] = { cost =  500, id = xi.items.CIPHER_OF_GILGAMESHS_ALTER_EGO }, -- Gilgamesh
        [10152] = { cost =  500, id = xi.items.CIPHER_OF_QULTADAS_ALTER_EGO }, -- Qultada
        [10181] = { cost =  500, id = xi.items.CIPHER_OF_KINGS_ALTER_EGO }, -- King
    },
--]]
    [20] = { -- Currency Exchange
        [ 0] = { amount = 1000, name = "spark_of_eminence"      },
        [ 1] = { amount = 1000, name = "conquest_points"        },
        [ 2] = { amount = 1000, name = "imperial_standing"      },
        [ 3] = { amount = 1000, name = "allied_notes"           },
        [ 4] = { amount = 1000, name = "bayld"                  },
        [ 5] = { amount = 1000, name = "valor_point"            },
        [ 6] = { amount = 1000, name = "leujaoam_assault_point" },
        [ 7] = { amount = 1000, name = "mamool_assault_point"   },
        [ 8] = { amount = 1000, name = "lebros_assault_point"   },
        [ 9] = { amount = 1000, name = "periqia_assault_point"  },
        [10] = { amount = 1000, name = "ilrusi_assault_point"   },
        [11] = { amount = 1000, name = "cruor"                  },
        [12] = { amount = 1000, name = "kinetic_unit"           },
        [13] = { amount = 1000, name = "obsidian_fragment"      },
        [14] = { amount = 1000, name = "mweya_plasm"            },
        [15] = { amount = 1000, name = "ballista_point"         },
        [16] = { amount = 1000, name = "unity_accolades"        },
        [17] = { amount = 1000, name = "escha_silt"             }, -- Not Implemented
        [18] = { amount = 1000, name = "resistance_credit"      },
    },
}

-- Get cap for currencies if necessary, for use by charutils::AddPoints()
local function getCurrencyCap(currencyName)
    local cap = nil

    if currencyName == "spark_of_eminence" then
        cap = xi.settings.main.CAP_CURRENCY_SPARKS
    elseif currencyName == "unity_accolades" then
        cap = xi.settings.main.CAP_CURRENCY_ACCOLADES
    elseif currencyName == "ballista_point" then
        cap = xi.settings.main.CAP_CURRENCY_BALLISTA
    elseif currencyName == "valor_point" then
        cap = xi.settings.main.CAP_CURRENCY_VALOR
    end

    return cap
end

function xi.sparkshop.onTrade(player, npc, trade, eventid)
    local copperVouchersStored = player:getCurrency("aman_vouchers")
    local count = trade:getItemQty(8711)

    if count > 0 then
        trade:confirmItem(8711, count)
        player:addCurrency("aman_vouchers", count)
        player:confirmTrade()
        player:startEvent(eventid, 8711, count + copperVouchersStored, 230)
    end
end

function xi.sparkshop.onTrigger(player, npc, event)
    local sparks = player:getCurrency("spark_of_eminence")
    local vouchers = player:getCurrency("aman_vouchers")
    local remainingLimit = (xi.settings.main.WEEKLY_EXCHANGE_LIMIT / 40) - player:getCharVar("weekly_sparks_spent")
    local cipher = xi.extravaganza.campaignActive() * 16 * 65536 -- Trust Alter Ego Extravaganza
    local naakual = 0 -- TODO: Naakual Seven Treasures Item Logic

    -- opens shop and lists available sparks
    player:startEvent(event, 0, sparks, vouchers, naakual, cipher, remainingLimit)
end

function xi.sparkshop.onEventUpdate(player,csid,option)
    local sparks = player:getCurrency("spark_of_eminence")
    local weeklySparksSpent = player:getCharVar("weekly_sparks_spent")
    local remainingLimit = (xi.settings.main.WEEKLY_EXCHANGE_LIMIT / 40) - weeklySparksSpent
    local category = bit.band(option, 0xFF)
    local selection = bit.rshift(option, 16)

    local qty = 1
    local requested_qty = bit.band(bit.rshift(option, 10), 0x3F)

    -- only skillup books and currencies can have qty > 1 aside from special cases such as ammo or shurikens
    if category == 2 or category == 20 or category == 30 then
        qty = requested_qty
    end

    -- There are three specific cases for Sparks rewards currently implemented:
    -- 1. Grant an Item based on Sparks cost (Category <= 10 or 12)
    -- 2. Grant Currency based on Vouchers spent (Category == 20)
    -- 3. Grant Provision Items based on Vouchers spent (Category == 30)
    if category <= 10 or category == 12 then
        local item = optionToItem[category][selection]
        local cost = item.cost * qty
        local pLevel = player:getMainLvl()
        local iLevel = item.lv

        -- makes sure player has room for three stacks of tomes
        if (qty > 12 and qty < 99) and player:getFreeSlotsCount() < 3 then
            player:messageSpecial(zones[player:getZoneID()].text.ITEM_CANNOT_BE_OBTAINED, item.id)
            player:updateEvent(sparks, 0, 0, 0, 0, remainingLimit)
            return
        end

        -- handles eminent ammo
        if item.id == 21302 or item.id == 21316 or item.id == 21331 then
            qty = 99
            cost = 5000

        elseif item.id == 21355 then
            qty = 99
            cost = 7000
        end

        -- verifies and finishes transaction
        if cost > remainingLimit and xi.settings.main.ENABLE_EXCHANGE_LIMIT == 1 then
            player:messageSpecial(zones[player:getZoneID()].text.MAX_SPARKS_LIMIT_REACHED, xi.settings.main.WEEKLY_EXCHANGE_LIMIT)
            player:PrintToPlayer( string.format("Weekly cap is 2500."), 29)
        elseif iLevel > pLevel then
            player:messageSpecial(zones[player:getZoneID()].text.ITEM_CANNOT_BE_OBTAINED, item.id)
        elseif sparks >= cost then
            if npcUtil.giveItem(player, { { item.id, qty } }) then
                sparks = sparks - cost
                player:delCurrency("spark_of_eminence", cost)
                if xi.settings.main.ENABLE_EXCHANGE_LIMIT == 1 then
                    remainingLimit = remainingLimit - cost
                    player:setCharVar("weekly_sparks_spent", weeklySparksSpent + cost)
                end
            end
        else
            player:messageSpecial(zones[player:getZoneID()].text.NOT_ENOUGH_SPARKS)
        end

        player:updateEvent(sparks, 0, 0, 0, 0, remainingLimit)
    elseif category == 20 then
        local copperVouchersStored = player:getCurrency("aman_vouchers")
        local currency = optionToItem[category][selection]

        if copperVouchersStored >= qty then
            player:delCurrency("aman_vouchers", qty)

            if currency.name == "conquest_points" then
                local nation = player:getNation()

                if nation == 0 then
                    currency.name = "sandoria_cp"
                elseif nation == 1 then
                    currency.name = "bastok_cp"
                elseif nation == 2 then
                    currency.name = "windurst_cp"
                end
            end

            player:addCurrency(currency.name, currency.amount * qty, getCurrencyCap(currency.name))
            player:messageSpecial(zones[player:getZoneID()].text.YOU_NOW_HAVE_AMT_CURRENCY, selection, player:getCurrency(currency.name))
        else
            player:messageSpecial(zones[player:getZoneID()].text.DO_NOT_POSSESS_ENOUGH, 8711)
        end
        player:updateEvent(sparks, player:getCurrency("aman_vouchers"))
    elseif category == 30 then
        local copperVouchersStored = player:getCurrency("aman_vouchers")

        if copperVouchersStored >= qty then
            if player:addItem({ id = selection, quantity = 2 * qty, silent = true }) then
                player:delCurrency("aman_vouchers", qty)
                player:messageSpecial(zones[player:getZoneID()].text.YOU_OBTAIN_ITEM, selection, 1) -- Retail: Provisions are always singular
            else
                player:messageSpecial(zones[player:getZoneID()].text.ITEM_CANNOT_BE_OBTAINED, selection)
            end
        else
            player:messageSpecial(zones[player:getZoneID()].text.DO_NOT_POSSESS_ENOUGH, 8711)
        end
        player:updateEvent(sparks, player:getCurrency("aman_vouchers"))
    end
end

function xi.sparkshop.onEventFinish(player, csid, option)
end
