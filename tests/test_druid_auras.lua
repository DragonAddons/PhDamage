-------------------------------------------------------------------------------
-- test_druid_auras.lua
-- Tests for Druid aura (buff/debuff) modifiers
--
-- Default Druid state:
--   AP=2000, meleeCrit=25%, meleeHit=0%, targetArmor=0
--   MH: 100-150 dmg, 2.5 speed, FIST
--   spellPower Nature=800, Arcane=800
--   spellCrit Nature=0.10, Arcane=0.10, intellect=350
--
-- Base values (no auras/talents):
--   Wrath R10:   min = 839.80, max = 888.80 (sp=800, coeff=0.571)
--   Starfire R8:  min = 1425.00, max = 1535.00 (sp=800, coeff=1.0)
--   Claw R6:     min = 357.86, max = 407.86 (weapon + AP/14*1.0 + 115)
--   Shred R7:    min = 1003.18, max = 1115.68 (weapon + AP/14*1.0 + 203)*2.25
--   Rip R7:      totalDmg = 1518.00 (dotDmg=1038 + AP*0.24)
-------------------------------------------------------------------------------
local bootstrap = require("tests.bootstrap")
local ns = bootstrap.ns
local makeDruidState = bootstrap.makeDruidState
local Pipeline = ns.Engine.Pipeline

describe("Druid Auras", function()

    ---------------------------------------------------------------------------
    -- 1. Moonkin Aura (24907) — +5% CRIT_BONUS (no filter, all spells)
    -- Base spellCrit Nature = 0.10; with Moonkin Aura = 0.15
    ---------------------------------------------------------------------------
    describe("Moonkin Aura", function()

        it("increases Wrath R10 crit chance by 0.05", function()
            local baseState = makeDruidState()
            local baseResult = Pipeline.Calculate(5176, baseState)

            local state = makeDruidState()
            state.auras.player[24907] = true
            local result = Pipeline.Calculate(5176, state)

            assert.is_near(baseResult.critChance + 0.05, result.critChance, 0.001)
            assert.is_near(0.15, result.critChance, 0.001)
        end)
    end)

    ---------------------------------------------------------------------------
    -- 2. Leader of the Pack (17007) — +5% CRIT_BONUS
    --    Filtered: Claw, Shred, Mangle (Cat), Rake, Ferocious Bite, Rip,
    --              Maul, Swipe, Mangle (Bear), Lacerate
    -- Base meleeCrit = 0.25; with LotP = 0.30
    ---------------------------------------------------------------------------
    describe("Leader of the Pack", function()

        it("increases Claw R6 crit chance by 0.05", function()
            local baseState = makeDruidState()
            local baseResult = Pipeline.Calculate(1082, baseState)

            local state = makeDruidState()
            state.auras.player[17007] = true
            local result = Pipeline.Calculate(1082, state)

            assert.is_near(0.25, baseResult.critChance, 0.001)
            assert.is_near(0.30, result.critChance, 0.001)
        end)
    end)

    ---------------------------------------------------------------------------
    -- 3. Nature's Grace (16886) — CAST_TIME_REDUCTION 0.5s
    -- Reduces cast time of next spell by 0.5s after a crit
    ---------------------------------------------------------------------------
    describe("Nature's Grace", function()

        it("reduces Starfire R8 cast time from 3.5 to 3.0", function()
            local baseState = makeDruidState()
            local baseResult = Pipeline.Calculate(2912, baseState)

            local state = makeDruidState()
            state.auras.player[16886] = true
            local result = Pipeline.Calculate(2912, state)

            assert.is_near(3.5, baseResult.castTime, 0.01)
            assert.is_near(3.0, result.castTime, 0.01)
        end)

        it("reduces Wrath R10 cast time from 2.0 to 1.5", function()
            local baseState = makeDruidState()
            local baseResult = Pipeline.Calculate(5176, baseState)

            local state = makeDruidState()
            state.auras.player[16886] = true
            local result = Pipeline.Calculate(5176, state)

            assert.is_near(2.0, baseResult.castTime, 0.01)
            assert.is_near(1.5, result.castTime, 0.01)
        end)

        it("reduces Healing Touch R13 cast time from 3.5 to 3.0", function()
            local baseState = makeDruidState()
            local baseResult = Pipeline.Calculate(5185, baseState)

            local state = makeDruidState()
            state.auras.player[16886] = true
            local result = Pipeline.Calculate(5185, state)

            assert.is_near(3.5, baseResult.castTime, 0.01)
            assert.is_near(3.0, result.castTime, 0.01)
        end)
    end)

    ---------------------------------------------------------------------------
    -- 4. Mangle Debuff (33878) — +30% DAMAGE_MULTIPLIER on target
    --    Filtered: Rake, Rip, Lacerate, Shred
    ---------------------------------------------------------------------------
    describe("Mangle Debuff", function()

        it("increases Shred R7 damage by 30%", function()
            local baseState = makeDruidState()
            local baseResult = Pipeline.Calculate(5221, baseState)

            local state = makeDruidState()
            state.auras.target[33878] = true
            local result = Pipeline.Calculate(5221, state)

            -- Without: min ~ 1003.18, max ~ 1115.68
            assert.is_near(1003.18, baseResult.minDmg, 1)
            assert.is_near(1115.68, baseResult.maxDmg, 1)
            -- With Mangle: * 1.30
            assert.is_near(1003.18 * 1.30, result.minDmg, 1)
            assert.is_near(1115.68 * 1.30, result.maxDmg, 1)
        end)

        it("increases Rip R7 DoT total damage by 30%", function()
            local baseState = makeDruidState()
            local baseResult = Pipeline.Calculate(1079, baseState)

            local state = makeDruidState()
            state.auras.target[33878] = true
            local result = Pipeline.Calculate(1079, state)

            -- Without: totalDmg = 1518.00 (dotDmg 1038 + AP*0.24)
            assert.is_near(1518.00, baseResult.totalDmg, 1)
            -- With Mangle: * 1.30
            assert.is_near(1518.00 * 1.30, result.totalDmg, 1)
        end)
    end)
end)
