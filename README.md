# PhDamage

[![GitHub Release](https://img.shields.io/github/v/release/Xerrion/PhDamage?style=flat-square)](https://github.com/Xerrion/PhDamage/releases)
[![Luacheck](https://img.shields.io/github/actions/workflow/status/Xerrion/PhDamage/lint.yml?label=luacheck&style=flat-square)](https://github.com/Xerrion/PhDamage/actions/workflows/lint.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue?style=flat-square)](LICENSE)

Expected damage and healing calculator for World of Warcraft -- TBC Anniversary.

## Overview

PhDamage computes and displays expected damage and healing values on spell tooltips and action bar buttons. "Expected" means the average outcome after accounting for hit chance and crit chance, so you see the true per-cast value rather than raw base damage. Calculations are based on your current talents, gear, buffs, and debuffs -- updated in real time as your character state changes.

## Features

- **All 9 classes supported** -- Druid, Hunter, Mage, Paladin, Priest, Rogue, Shaman, Warlock, Warrior
- **Real-time calculations** -- Automatically updates when talents, gear, or buffs change
- **Tooltip integration** -- School-colored damage/healing values displayed in a companion tooltip frame
- **Action bar overlays** -- Expected damage shown directly on action bar buttons
- **1,000+ unit tests** -- Comprehensive test coverage ensuring calculation accuracy

## Supported Versions

| Version | Interface |
|---------|-----------|
| TBC Anniversary | `20505` |

## Architecture

PhDamage follows a strict 4-layer architecture where the engine layer is pure Lua with no WoW API dependencies, making it fully testable outside the game.

| Layer | Directory | Purpose |
|-------|-----------|---------|
| Shell | `Core/` | WoW API interaction, event handling, state collection |
| Engine | `Engine/` | Pure Lua calculation pipeline -- no WoW API calls |
| Data | `Data/` | Declarative spell, talent, and aura descriptor tables |
| Presentation | `Presentation/` | Tooltip rendering and action bar overlays |

## Supported Spell Types

| Type | Examples |
|------|----------|
| Direct | Frostbolt, Shadow Bolt, Holy Light |
| DoT | Corruption, Consecration, Moonfire (periodic) |
| Hybrid | Immolate, Moonfire (direct + DoT) |
| Channel | Drain Life, Mind Flay |
| Melee | Sinister Strike, Heroic Strike, Mutilate |
| Ranged | Auto Shot, Arcane Shot, Steady Shot |

## Installation

### Manual

1. Download the latest release from [GitHub Releases](https://github.com/Xerrion/PhDamage/releases)
2. Extract to your `Interface/AddOns/` directory
3. Restart WoW or `/reload`

## Slash Commands

| Command | Description |
|---------|-------------|
| `/phd` | Show diagnostic information for all spells |
| `/phd state` | Show current player state snapshot |
| `/phd spell <name>` | Detailed breakdown for a specific spell |
| `/phd help` | List available commands |

`/phdamage` works as an alias for `/phd`.

## Dependencies

- [Ace3](https://www.wowace.com/projects/ace3) -- bundled automatically via `.pkgmeta`

## Development

### Prerequisites

- [Luacheck](https://github.com/mpeterv/luacheck) -- static analysis
- [Busted](https://olivinelabs.com/busted/) -- unit testing framework

### Running Tests

```bash
busted --pattern="test_" tests/
```

### Linting

```bash
luacheck .
```

## License

[MIT](LICENSE)
