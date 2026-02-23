# Changelog

## [1.1.0](https://github.com/Xerrion/PhDamage/compare/1.0.0...1.1.0) (2026-02-23)


### Features

* add druid class support (21 spells, 19 talents, 4 auras) ([3e335b3](https://github.com/Xerrion/PhDamage/commit/3e335b3e4e06b33a4944ea95071544e027758b10))
* add label prefixes to tooltip sub-lines ([dc8d440](https://github.com/Xerrion/PhDamage/commit/dc8d440c3c08588deed75205d1a1de533ac21407))
* add mage class support with 15 spells, 21 talents, and 4 auras ([bd1bc46](https://github.com/Xerrion/PhDamage/commit/bd1bc469bd1464cf92f8a5fbced4a6a3ecfbf4bb))
* add melee engine support and Warrior class ([23cb3db](https://github.com/Xerrion/PhDamage/commit/23cb3dbd332593f4d4a5af3b15c9c34e22d7609c))
* add Paladin class support ([fabf5fd](https://github.com/Xerrion/PhDamage/commit/fabf5fdfd937d633cd9de8427da3c6df64cc0a3f))
* add Phase 3 test infrastructure, spells, and talents ([55ff24d](https://github.com/Xerrion/PhDamage/commit/55ff24da162f06cf55d6fbb7de11f0d807b7945b))
* add Phase 4 spell haste, new spells, and demonic tactics ([d03c69e](https://github.com/Xerrion/PhDamage/commit/d03c69efda4feae8f27a44089f25fd60a273486c))
* add priest class support with 7 spells, 8 talents, and 3 auras ([440ee23](https://github.com/Xerrion/PhDamage/commit/440ee2368bb239566e6f170a78d60ca1096ee12c))
* add Rogue class support ([1b2d6f1](https://github.com/Xerrion/PhDamage/commit/1b2d6f10acec501d51922cbeb6716c1a455f2755))
* add Shaman class support ([fa1a2ea](https://github.com/Xerrion/PhDamage/commit/fa1a2eaf6ec7d03c6ce845f3a8dcc6136a073fb4))
* initial commit for PhDamage Phase 1 implementation ([95f73eb](https://github.com/Xerrion/PhDamage/commit/95f73eb1576d67e39c8918bc92cc5b8460c3c238))
* phase 2 tooltip hooks and ActionBar text overlay ([f26d4d0](https://github.com/Xerrion/PhDamage/commit/f26d4d0a8c19b1c220c4ce3700273f1f0e721183))
* redesign tooltip for better readability ([93117bf](https://github.com/Xerrion/PhDamage/commit/93117bf98d997a4423a380caeaba71c7e5afc135))
* **tooltip:** add colored labels and split scaling into separate lines ([0315e95](https://github.com/Xerrion/PhDamage/commit/0315e95b9d8aed903b78c5ef007f7211aa7d1726))
* **tooltip:** add Scaling line showing coefficient, cast time, talent bonus ([0100309](https://github.com/Xerrion/PhDamage/commit/0100309e1725713b2fc1c8b05396e6ceab0d008b))
* **tooltip:** render PhDamage info in separate companion frame ([2cc409c](https://github.com/Xerrion/PhDamage/commit/2cc409cea1bfb06650cfe1208967a6bf8ba293d7))


### Bug Fixes

* add missing PrintSpellDot function and create PrintSpellDirect ([76b5251](https://github.com/Xerrion/PhDamage/commit/76b525102858d8534359b0743981af5d10cf6d4b))
* address code review feedback for C_UnitAuras and DoT DPS ([2a05d96](https://github.com/Xerrion/PhDamage/commit/2a05d968c2aa5aeb796fbd591ee99fdf982157a1))
* **engine:** fix CritCalc.lua syntax error from corrupted edit ([fb47ce1](https://github.com/Xerrion/PhDamage/commit/fb47ce1c54de1085ae362a8b18daf83f37186332))
* **engine:** missing hit multiplier on hybrid and periodic components ([696be54](https://github.com/Xerrion/PhDamage/commit/696be548361393186d1aa05f5b42c94ef1964351))
* logic and data bugs from Phase 1 review ([bdc6c03](https://github.com/Xerrion/PhDamage/commit/bdc6c03cadca68223b3f5ce8b8d3274fa8587c49))
* malediction talent, redundant aura scan, and dead code ([a4f57a8](https://github.com/Xerrion/PhDamage/commit/a4f57a8633c1d23e1a4677f41365e82e1d9bbb1b))
* phase 1 critical bugs ([a4e91ad](https://github.com/Xerrion/PhDamage/commit/a4e91ade1008c13aa1f365c0154972104c504b97))
* phase 2 high severity bugs ([7031acf](https://github.com/Xerrion/PhDamage/commit/7031acf8cec7efc664dc5ec20fc361024588ec94))
* phase 5 hunter class + code review (16 bug fixes) ([b62080f](https://github.com/Xerrion/PhDamage/commit/b62080f7e9e9ec744694f473f0296aad895bf110))
* resolve critical engine bugs and improve code quality ([76d4b52](https://github.com/Xerrion/PhDamage/commit/76d4b52147d440680aae6f3c0ce792047520a75b))
* **tooltip:** anchor companion frame below GameTooltip instead of beside ([f30d357](https://github.com/Xerrion/PhDamage/commit/f30d35711f871ff8d73ffa067f365facaf13ad94))
* **tooltip:** fix ElvUI SetTemplate call — use mixin method with pcall guard ([35ecc8c](https://github.com/Xerrion/PhDamage/commit/35ecc8c178e06505fbe6ad3fd5c3218b75825b7c))
* **tooltip:** rank selection and ActionBar ElvUI compatibility ([5a7f795](https://github.com/Xerrion/PhDamage/commit/5a7f795b916b9dcbfc1e89dbaba6674685e99b2b))


### Performance

* phase 3 performance optimizations ([70dae55](https://github.com/Xerrion/PhDamage/commit/70dae557eaac41e019631c07f67bfbf8f1103a54))


### Refactor

* phase 4 code cleanup and design fixes ([66ce98d](https://github.com/Xerrion/PhDamage/commit/66ce98ddb946c6fa7dcdfd9fab8b564c1702d4e9))


### Documentation

* add README with badges and MIT license ([46e9712](https://github.com/Xerrion/PhDamage/commit/46e9712e9cf10eeeb6cefd80a8a0cb807d94da90))
* polish README with flat-square badges and structured tables ([2627704](https://github.com/Xerrion/PhDamage/commit/26277046a0f3eaa552302304862b3bf1c23d28bf))


### CI/CD

* fix release workflow ([86dc447](https://github.com/Xerrion/PhDamage/commit/86dc4473f24e920b9de2bcb5c3d201c6bcc97a23))
* migrate from git-cliff to release-please ([#1](https://github.com/Xerrion/PhDamage/issues/1)) ([a588e0f](https://github.com/Xerrion/PhDamage/commit/a588e0fcf4cb813b30d3ba9e1c0b7747edf3dbca))

## [unreleased]

### 💼 Other

- Fix missing hit multiplier on hybrid and periodic components
- Fix CritCalc.lua syntax error from corrupted edit
