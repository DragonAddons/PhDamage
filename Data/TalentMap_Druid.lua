-------------------------------------------------------------------------------
-- TalentMap_Druid
-- Druid talent modifier definitions for PhDamage
--
-- Supported versions: TBC Anniversary
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...
ns.TalentMap = ns.TalentMap or {}

local MOD = ns.MOD
local SCHOOL_PHYSICAL = ns.SCHOOL_PHYSICAL

local TalentMap = {}

-------------------------------------------------------------------------------
-- Balance (Tab 1)
-------------------------------------------------------------------------------

-- Starlight Wrath: -0.1s cast time on Wrath and Starfire per rank
TalentMap["1:2"] = {
    name = "Starlight Wrath",
    maxRank = 5,
    effects = {
        { type = MOD.CAST_TIME_REDUCTION, value = 0.1, perRank = true,
          filter = { spellNames = { "Wrath", "Starfire" } } },
    },
}

-- Improved Moonfire: +5% Moonfire damage and +5% Moonfire crit per rank
TalentMap["1:3"] = {
    name = "Improved Moonfire",
    maxRank = 2,
    effects = {
        { type = MOD.DAMAGE_MULTIPLIER, value = 0.05, perRank = true,
          filter = { spellNames = { "Moonfire" } } },
        { type = MOD.CRIT_BONUS, value = 0.05, perRank = true,
          filter = { spellNames = { "Moonfire" } } },
    },
}

-- Brambles: +25% Entangling Roots damage per rank
TalentMap["1:5"] = {
    name = "Brambles",
    maxRank = 3,
    effects = {
        { type = MOD.DAMAGE_MULTIPLIER, value = 0.25, perRank = true, stacking = "additive",
          filter = { spellNames = { "Entangling Roots" } } },
    },
}

-- Moonfury: +2% Starfire/Moonfire/Wrath damage per rank
TalentMap["1:11"] = {
    name = "Moonfury",
    maxRank = 5,
    effects = {
        { type = MOD.DAMAGE_MULTIPLIER, value = 0.02, perRank = true, stacking = "additive",
          filter = { spellNames = { "Starfire", "Moonfire", "Wrath" } } },
    },
}

-- Vengeance: +10/20/30/40/50% crit damage bonus (non-linear scaling)
TalentMap["1:12"] = {
    name = "Vengeance",
    maxRank = 5,
    effects = {
        { type = MOD.CRIT_MULT_BONUS, value = { 0.10, 0.20, 0.30, 0.40, 0.50 } },
    },
}

-- Lunar Guidance: 8/16/25% of Intellect added as spell power (non-linear)
TalentMap["1:15"] = {
    name = "Lunar Guidance",
    maxRank = 3,
    effects = {
        { type = MOD.SPELL_POWER_BONUS, value = { 0.08, 0.16, 0.25 }, statField = "intellect" },
    },
}

-- Balance of Power: +2% spell hit per rank
TalentMap["1:16"] = {
    name = "Balance of Power",
    maxRank = 2,
    effects = {
        { type = MOD.SPELL_HIT_BONUS, value = 0.02, perRank = true },
    },
}

-- Wrath of Cenarius: +4% Starfire coeff and +2% Wrath coeff per rank
TalentMap["1:19"] = {
    name = "Wrath of Cenarius",
    maxRank = 5,
    effects = {
        { type = MOD.COEFFICIENT_BONUS, value = 0.04, perRank = true,
          filter = { spellNames = { "Starfire" } } },
        { type = MOD.COEFFICIENT_BONUS, value = 0.02, perRank = true,
          filter = { spellNames = { "Wrath" } } },
    },
}

-- Focused Starlight: +2% crit chance on Wrath and Starfire per rank
TalentMap["1:21"] = {
    name = "Focused Starlight",
    maxRank = 2,
    effects = {
        { type = MOD.CRIT_BONUS, value = 0.02, perRank = true,
          filter = { spellNames = { "Wrath", "Starfire" } } },
    },
}

-------------------------------------------------------------------------------
-- Feral (Tab 2)
-------------------------------------------------------------------------------

-- Sharpened Claws: +2% melee crit per rank (feral abilities)
TalentMap["2:5"] = {
    name = "Sharpened Claws",
    maxRank = 3,
    effects = {
        { type = MOD.CRIT_BONUS, value = 0.02, perRank = true,
          filter = { spellNames = { "Claw", "Shred", "Mangle (Cat)", "Rake", "Ferocious Bite", "Rip",
                                    "Maul", "Swipe", "Mangle (Bear)", "Lacerate" } } },
    },
}

-- Savage Fury: +10% Claw/Rake/Mangle (Cat) damage per rank
TalentMap["2:11"] = {
    name = "Savage Fury",
    maxRank = 2,
    effects = {
        { type = MOD.DAMAGE_MULTIPLIER, value = 0.10, perRank = true, stacking = "additive",
          filter = { spellNames = { "Claw", "Rake", "Mangle (Cat)" } } },
    },
}

-- Predatory Instincts: +3/6/10/13/16% melee crit damage (non-linear, cat abilities)
TalentMap["2:19"] = {
    name = "Predatory Instincts",
    maxRank = 5,
    effects = {
        { type = MOD.CRIT_MULT_BONUS, value = { 0.03, 0.06, 0.10, 0.13, 0.16 },
          filter = { spellNames = { "Claw", "Shred", "Mangle (Cat)", "Rake", "Ferocious Bite", "Rip" } } },
    },
}

-------------------------------------------------------------------------------
-- Restoration (Tab 3)
-------------------------------------------------------------------------------

-- Naturalist: -0.1s Healing Touch cast time and +2% physical damage per rank
TalentMap["3:4"] = {
    name = "Naturalist",
    maxRank = 5,
    effects = {
        { type = MOD.CAST_TIME_REDUCTION, value = 0.1, perRank = true,
          filter = { spellNames = { "Healing Touch" } } },
        { type = MOD.DAMAGE_MULTIPLIER, value = 0.02, perRank = true, stacking = "additive",
          filter = { school = SCHOOL_PHYSICAL } },
    },
}

-- Improved Regrowth: +10% Regrowth crit chance per rank
TalentMap["3:5"] = {
    name = "Improved Regrowth",
    maxRank = 5,
    effects = {
        { type = MOD.CRIT_BONUS, value = 0.10, perRank = true,
          filter = { spellNames = { "Regrowth" } } },
    },
}

-- Gift of Nature: +2% healing spell effectiveness per rank
TalentMap["3:8"] = {
    name = "Gift of Nature",
    maxRank = 5,
    effects = {
        { type = MOD.DAMAGE_MULTIPLIER, value = 0.02, perRank = true, stacking = "additive",
          filter = { spellNames = { "Healing Touch", "Rejuvenation", "Regrowth", "Lifebloom",
                                    "Tranquility" } } },
    },
}

-- Improved Rejuvenation: +5% Rejuvenation healing per rank
TalentMap["3:10"] = {
    name = "Improved Rejuvenation",
    maxRank = 3,
    effects = {
        { type = MOD.DAMAGE_MULTIPLIER, value = 0.05, perRank = true, stacking = "additive",
          filter = { spellNames = { "Rejuvenation" } } },
    },
}

-- Empowered Touch: +10% Healing Touch spell power coefficient per rank
TalentMap["3:16"] = {
    name = "Empowered Touch",
    maxRank = 2,
    effects = {
        { type = MOD.COEFFICIENT_BONUS, value = 0.10, perRank = true,
          filter = { spellNames = { "Healing Touch" } } },
    },
}

-- Empowered Rejuvenation: +4% HoT spell power coefficient per rank
TalentMap["3:17"] = {
    name = "Empowered Rejuvenation",
    maxRank = 5,
    effects = {
        { type = MOD.COEFFICIENT_BONUS, value = 0.04, perRank = true,
          filter = { spellNames = { "Rejuvenation", "Regrowth", "Lifebloom", "Tranquility" } } },
    },
}

-- Natural Perfection: +1% spell crit per rank (all spells)
TalentMap["3:18"] = {
    name = "Natural Perfection",
    maxRank = 3,
    effects = {
        { type = MOD.CRIT_BONUS, value = 0.01, perRank = true },
    },
}

-- Merge into addon namespace with class prefix
for key, data in pairs(TalentMap) do
    ns.TalentMap["DRUID:" .. key] = data
end
