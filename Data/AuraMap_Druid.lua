-------------------------------------------------------------------------------
-- AuraMap_Druid.lua
-- Druid-relevant buff and debuff effects mapped to modifier descriptors
-- SpellIDs sourced from Wowhead TBC Classic
--
-- Supported versions: TBC Anniversary
-------------------------------------------------------------------------------

local ADDON_NAME, ns = ...

local MOD = ns.MOD

local AuraMap = {}

-------------------------------------------------------------------------------
-- Player Buffs (target = "player")
-------------------------------------------------------------------------------

-- Moonkin Aura: +5% spell crit chance
AuraMap[24907] = {
    name = "Moonkin Aura",
    target = "player",
    effects = {
        { type = MOD.CRIT_BONUS, value = 0.05 },
    },
}

-- Leader of the Pack: +5% melee crit chance (feral abilities)
AuraMap[17007] = {
    name = "Leader of the Pack",
    target = "player",
    effects = {
        { type = MOD.CRIT_BONUS, value = 0.05,
          filter = { spellNames = { "Claw", "Shred", "Mangle (Cat)", "Rake", "Ferocious Bite", "Rip",
                                    "Maul", "Swipe", "Mangle (Bear)", "Lacerate" } } },
    },
}

-- Nature's Grace: -0.5s cast time on next spell after a crit
AuraMap[16886] = {
    name = "Nature's Grace",
    target = "player",
    effects = {
        { type = MOD.CAST_TIME_REDUCTION, value = 0.5 },
    },
}

-------------------------------------------------------------------------------
-- Target Debuffs (target = "target")
-------------------------------------------------------------------------------

-- Mangle: target takes +30% bleed damage
AuraMap[33878] = {
    name = "Mangle",
    target = "target",
    effects = {
        { type = MOD.DAMAGE_MULTIPLIER, value = 0.30,
          filter = { spellNames = { "Rake", "Rip", "Lacerate", "Shred" } } },
    },
}

for spellID, data in pairs(AuraMap) do
    ns.AuraMap[spellID] = data
end
