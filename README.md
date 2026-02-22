# PhDamage

[![Luacheck](https://github.com/Xerrion/PhDamage/actions/workflows/lint.yml/badge.svg)](https://github.com/Xerrion/PhDamage/actions/workflows/lint.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![WoW Version](https://img.shields.io/badge/WoW-TBC%20Anniversary%202.5.5-blue)](https://worldofwarcraft.blizzard.com)

Expected damage and healing calculator for World of Warcraft TBC Anniversary (2.5.5). PhDamage computes and displays expected damage/healing values on action bar buttons and spell tooltips based on your current talents, gear, buffs, and debuffs.

## Features

- **9 classes fully supported**: Warlock, Hunter, Mage, Priest, Warrior, Rogue, Druid, Shaman, Paladin
- **Real-time calculations** based on current player state (talents, gear, buffs)
- **Tooltip integration** with school-colored damage/healing values
- **Action bar overlays** showing expected damage on spell buttons
- **1100+ unit tests** ensuring calculation accuracy

## Supported Spell Types

- Direct damage and healing spells
- Damage over Time (DoT) effects
- Hybrid spells (direct + DoT components)
- Channeled spells
- Melee abilities (weapon damage, AP scaling)
- Ranged abilities

## Architecture

PhDamage follows a strict 4-layer architecture:

| Layer | Directory | Purpose |
|-------|-----------|---------|
| Shell | `Core/` | WoW API interaction, event handling, state collection |
| Engine | `Engine/` | Pure Lua calculation pipeline (no WoW API dependencies) |
| Data | `Data/` | Declarative spell, talent, and aura descriptor tables |
| Presentation | `Presentation/` | Tooltip rendering, action bar overlays |

## Installation

1. Download the latest release from [GitHub Releases](https://github.com/Xerrion/PhDamage/releases)
2. Extract to your `Interface/AddOns/` directory
3. Restart WoW or `/reload`

## Slash Commands

- `/phd` — Show diagnostic information
- `/phd help` — List available commands

## Dependencies

- [Ace3](https://www.wowace.com/projects/ace3) (bundled via .pkgmeta)

## Development

### Prerequisites

- [Luacheck](https://github.com/mpeterv/luacheck) for linting
- [Busted](https://olivinelabs.com/busted/) for testing

### Running Tests

```bash
cd PhDamage
busted --pattern="test_" tests/
```

### Linting

```bash
luacheck .
```

## License

MIT License — see [LICENSE](LICENSE) for details.
