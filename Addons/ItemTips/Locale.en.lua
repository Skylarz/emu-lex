
ItemTips.Stats = {
	-- Put these first to make sure they're not counted
	{ weight = ItemTips.Huge,	pattern = "use:" },						-- use
	{ weight = ItemTips.Huge,	pattern = "chance on hit:" },					-- chance on hit
	{ weight = ItemTips.Huge,	pattern = "pet" },						-- pet stats
	{ weight = 0,	pattern = "set:" },								-- set bonus
	{ weight = 0,	pattern = "socket bonus:" },							-- socket bonus
	{ weight = 0,	pattern = "equip: i.+ attack power by (%d+) in" },			-- feral ap

	-- Plain stats
	{ weight = 1,	pattern = "%+(%d+) strength" },
	{ weight = 1,	pattern = "%+(%d+) agility" },
	{ weight = 1,	pattern = "%+(%d+) stamina",	cap = {0,0,65,74,92,0} },		-- old stamina price
	{ weight = 2/3,	pattern = "%+(%d+) stamina" },						-- BC stamina price
	{ weight = 1,	pattern = "%+(%d+) intellect" },
	{ weight = 1,	pattern = "%+(%d+) spirit" },

	-- Common stats
	{ weight = 1,	pattern = "equip: i.+ rating by (%d+)" },					-- any combat rating
	{ weight = 1,	pattern = "%+(%d+) .+ rating" },						-- any combat rating
	{ weight = 0.5,	pattern = "equip: i.+ attack power by (%d+)" },				-- generic ap
	{ weight = 0.5,	pattern = "%+(%d+) attack power" },						-- generic ap
	{ weight = 0.4,	pattern = "equip: i.+ ranged attack power by (%d+)" },		-- ranged ap
	{ weight = 0.455,	pattern = "equip: i.+ healing done by up to (%d+)" },			-- healing
	{ weight = 0.455,	pattern = "%+(%d+) healing[%sspells]?" },					-- healing
	{ weight = 0.855,	pattern = "equip: i.+ damage and healing .+ (%d+)" },			-- generic dmg/healing
	{ weight = 0.855,	pattern = "%+(%d+) spell damage" },						-- generic dmg/healing
	{ weight = 0.7,	pattern = "equip: i.+ damage done by .+ (%d+)" },			-- single school spell dmg
	{ weight = 0.7,	pattern = "%+(%d+) .+ damage" },						-- single school spell dmg
	{ weight = 1.25,	pattern = "equip: i.+ penetration by (%d+)" },				-- spell penetration
	{ weight = 1,	pattern = "%+(%d+) .+ resistance" },					-- spell resistance
	{ weight = 2.4,	pattern = "equip: restores (%d+)" },					-- mana/health regen
	{ weight = 2.4,	pattern = "%+(%d+) .+ per 5 sec" },						-- mana/health regen
	{ weight = 2.4,	pattern = "%+(%d+) .+ every 5 sec" },					-- mana/health regen
	{ weight = 0.65,	pattern = "equip: i.+ block value .+ (%d+)" },				-- shield block value
	{ weight = 18,	pattern = "meta socket" },							-- meta socket
	{ weight = 9,	pattern = ".+ socket" },							-- red/blue/yellow socket
	{ weight = 0.175,	pattern = "equip: your attacks ignore (%d+)" },				-- armor penetration

	-- Obscure stats that don't have solid costs
	{ weight = 1/3,	pattern = "equip: .+ attack power vs .+ (%d+)" },			-- specific mob type ap (undead, beasts, demons)
	{ weight = 0.55,	pattern = "equip: .+ damage done to .+ (%d+)" },			-- specific mob type spell dmg (ie. undead)
	{ weight = 10,	pattern = "equip: .+ stealth level by (%d+)" },				-- stealth
	{ weight = 16,	pattern = "equip: .+ stealth level" },					-- stealth
	{ weight = 5,	pattern = "equip: .(%d+) weapon damage" },				-- weapon damage (seems a bit too high but not many items to check with)
	{ weight = 7.5,	pattern = "equip: allows underwater breathing" },			-- underwater breathing (3 items averaged cost)
	{ weight = 7.5,	pattern = "equip: run speed" },						-- run speed
	{ weight = 5,	pattern = "equip: slightly i.+ stealth detection" },			-- stealth detection

	-- Last resort matches for unknown stats
	{ weight = ItemTips.Huge,	pattern = "equip:" },
}

ItemTips.Armor = "(%d+) armor"
ItemTips.Dps = "(%d+%.%d+) damage per second"

ItemTips.Slots = {
	["INVTYPE_HEAD"] = 1,
	["INVTYPE_NECK"] = 1.82,
	["INVTYPE_SHOULDER"] = 1.29,
	["INVTYPE_CHEST"] = 1,				-- chest (ie. tunics)
	["INVTYPE_ROBE"] = 1,				-- chest (ie. caster robes)
	["INVTYPE_WAIST"] = 1.29,
	["INVTYPE_LEGS"] = 1,
	["INVTYPE_FEET"] = 1.29,
	["INVTYPE_WRIST"] = 1.82,			
	["INVTYPE_HAND"] = 1.29,
	["INVTYPE_FINGER"] = 1.82,
	["INVTYPE_TRINKET"] = 1.43,
	["INVTYPE_CLOAK"] = 1.82,
	["INVTYPE_WEAPON"] = 2.38,			-- 1h weapon
	["INVTYPE_SHIELD"] = 1.82,
	["INVTYPE_2HWEAPON"] = 1,
	["INVTYPE_WEAPONMAINHAND"] = 2.38,		-- mainhand weapon
	["INVTYPE_WEAPONOFFHAND"] = 2.38,		-- offhand weapon
	["INVTYPE_HOLDABLE"] = 1.82,			-- held in offhand
	["INVTYPE_RANGED"] = 3.33,			-- ranged
	["INVTYPE_THROWN"] = 3.33,			-- thrown
	["INVTYPE_RANGEDRIGHT"] = 3.33,		-- wands
	["INVTYPE_RELIC"] = 3.33,			-- relics

-- Other locations we don't care about
	["INVTYPE_AMMO"] = 0,
	["INVTYPE_BODY"] = 0,
	["INVTYPE_TABARD"] = 0,
	["INVTYPE_BAG"] = 0,
	[""] = 0,
}