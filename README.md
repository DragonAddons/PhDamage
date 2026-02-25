<div align="center">

# PhDamage

**Expected damage and healing calculator for World of Warcraft -- TBC Anniversary.**

PhDamage computes and displays expected damage and healing values on spell tooltips and action bar buttons. "Expected" means the average outcome after accounting for hit chance and crit chance, so you see the true per-cast value rather than raw base damage. Calculations are based on your current talents, gear, buffs, and debuffs -- updated in real time as your character state changes.

[![Latest Release](https://img.shields.io/github/v/release/Xerrion/PhDamage?style=for-the-badge&logo=github&label=Latest%20Release)](https://github.com/Xerrion/PhDamage/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![WoW Version: TBC Anniversary](https://img.shields.io/badge/WoW-TBC%20Anniversary-blue?style=for-the-badge&logo=battledotnet)](https://worldofwarcraft.blizzard.com/)
[![Luacheck](https://img.shields.io/github/actions/workflow/status/Xerrion/PhDamage/lint.yml?style=for-the-badge&label=Luacheck)](https://github.com/Xerrion/PhDamage/actions/workflows/lint.yml)

</div>

---

## 🎯 Features

- **All 9 classes supported** -- Druid, Hunter, Mage, Paladin, Priest, Rogue, Shaman, Warlock, Warrior
- **Real-time calculations** -- Automatically updates when talents, gear, or buffs change
- **Tooltip integration** -- School-colored damage/healing values displayed in a companion tooltip frame
- **Action bar overlays** -- Expected damage shown directly on action bar buttons
- **1,000+ unit tests** -- Comprehensive test coverage ensuring calculation accuracy

---

## 🪄 Supported Spell Types

| Type | Examples |
|------|----------|
| Direct | Frostbolt, Shadow Bolt, Holy Light |
| DoT | Corruption, Consecration, Moonfire (periodic) |
| Hybrid | Immolate, Moonfire (direct + DoT) |
| Channel | Drain Life, Mind Flay |
| Melee | Sinister Strike, Heroic Strike, Mutilate |
| Ranged | Auto Shot, Arcane Shot, Steady Shot |

---

## 🌍 Supported Versions

| Version | Interface |
|---------|-----------|
| TBC Anniversary | `20505` |

---

## 📦 Installation

### Download

<div align="center">

[![CurseForge](https://img.shields.io/badge/CurseForge-Download-F16436?style=for-the-badge&logo=curseforge)](https://www.curseforge.com/wow/addons/phdamage)
[![Wago](https://img.shields.io/badge/Wago-Download-C1272D?style=for-the-badge&logo=wago)](https://addons.wago.io/addons/phdamage)
[![GitHub](https://img.shields.io/badge/GitHub-Releases-181717?style=for-the-badge&logo=github)](https://github.com/Xerrion/PhDamage/releases)

</div>

### Manual Install

1. Download the latest release from one of the sources above
2. Extract the `PhDamage` folder into your AddOns directory:
   ```text
   World of Warcraft/_anniversary_/Interface/AddOns/PhDamage
   ```
3. Restart WoW or type `/reload`

---

## ⌨️ Commands

| Command | Description |
|---------|-------------|
| `/phd` | Show diagnostic information for all spells |
| `/phd state` | Show current player state snapshot |
| `/phd spell <name>` | Detailed breakdown for a specific spell |
| `/phd help` | List available commands |

`/phdamage` works as an alias for `/phd`.

---

## 🏗️ Architecture

PhDamage follows a strict 4-layer architecture where the engine layer is pure Lua with no WoW API dependencies, making it fully testable outside the game.

| Layer | Directory | Purpose |
|-------|-----------|---------|
| Shell | `Core/` | WoW API interaction, event handling, state collection |
| Engine | `Engine/` | Pure Lua calculation pipeline -- no WoW API calls |
| Data | `Data/` | Declarative spell, talent, and aura descriptor tables |
| Presentation | `Presentation/` | Tooltip rendering and action bar overlays |

---

## 🔗 Dependencies

- [Ace3](https://www.wowace.com/projects/ace3) -- bundled automatically via `.pkgmeta`

---

## 🔧 Development

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

---

## 🤝 Contributing

Contributions are welcome! Feel free to open an [issue](https://github.com/Xerrion/PhDamage/issues) or submit a [pull request](https://github.com/Xerrion/PhDamage/pulls).

1. Fork the repository
2. Create your feature branch
3. Make your changes and run `luacheck .`
4. Open a pull request

---

<div align="center">

## 📄 License

This project is licensed under the **MIT License** -- see the [LICENSE](LICENSE) file for details.

---

Made with ❤️ by [Xerrion](https://github.com/Xerrion)

</div>
