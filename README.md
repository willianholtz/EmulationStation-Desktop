# 🎮 ES-DE + RetroArch Setup (Linux / Arch)

![Linux](https://img.shields.io/badge/Linux-Compatible-green)
![Arch](https://img.shields.io/badge/Arch-Tested-blue)
![RetroArch](https://img.shields.io/badge/RetroArch-libretro-orange)
![ES-DE](https://img.shields.io/badge/Frontend-ES--DE-red)
![Status](https://img.shields.io/badge/Status-Stable-success)

---

<p align="center">
  <img src="es-de.jpg" width="360"/>
  <img src="retroarch.png" width="360"/>
</p>

---

## 🚀 Overview

A clean and minimal setup for **ES-DE** using **RetroArch (libretro cores only)**.

This project focuses on:

* Simplicity
* Stability
* Clean file structure
* Full control over configuration

No unnecessary layers. No hidden behavior.

---

## ✨ Features

* 🎯 Single backend: RetroArch only
* ⚡ Vulkan-based rendering
* 🧩 Custom `es_systems.xml` configuration
* 🧼 Clean `.config`-based structure
* 🚫 No overlays or unwanted shaders by default
* 🔁 Easy to maintain and extend

---

## ⚡ Quick Start

```bash
gh repo clone willianholtz/EmulationStation-Desktop

cd EmulationStation-Desktop

./ES-DE_x64.AppImage --home ~/.config/
```

---

## ⚙️ Running ES-DE

### AppImage (Recommended)

```bash
./ES-DE_x64.AppImage --home ~/.config/
```

---

## 🧠 Why use `--home`?

By default, ES-DE spreads files across multiple locations in your home directory.

Using:

```bash
--home ~/.config/
```

forces ES-DE to:

* Store everything in one place
* Keep configs isolated
* Avoid clutter in `$HOME`
* Make backups and version control easier

Result: a clean and predictable setup.

---

### Installed Version (Package Manager)

#### Option 1 — Script

```bash
#!/bin/bash
es-de --home ~/.config/
```

---

#### Option 2 — Desktop Entry

Edit:

```bash
~/.local/share/applications/es-de.desktop
```

Change:

```ini
Exec=es-de --home ~/.config/
```

---

## 📦 Directory Structure

```bash
~/.config/
├── ES-DE/
│   ├── custom_systems/
│   │   └── es_systems.xml
│   ├── retroarch.cfg
│   └── gamelists/
├── retroarch/
│   ├── cores/
│   ├── roms/
│   ├── saves/
│   └── states/
```

---

## 📁 ROMs and Cores

### ROMs

All ROMs must be placed in:

```bash
~/.config/retroarch/roms/
```

Example structure:

```bash
Nintendo - Super Nintendo Entertainment System/
Nintendo - Nintendo Entertainment System/
Sony - PlayStation/
```

⚠️ Folder names must match `es_systems.xml` exactly.

---

### Cores

Located in:

```bash
~/.config/retroarch/cores/
```

Examples:

```bash
bsnes_libretro.so
mesen_libretro.so
parallel_n64_libretro.so
```

---

## 🎯 ES-DE Configuration

File:

```bash
~/.config/ES-DE/es_settings.xml
```

```xml
<string name="ROMDirectory" value="~/retroarch/roms/" />
```

---

## 🧩 es_systems.xml Example

```xml
<system>
    <name>snes</name>
    <fullname>Super Nintendo</fullname>
    <path>%ROMPATH%/Nintendo - Super Nintendo Entertainment System</path>
    <extension>.sfc .smc .zip</extension>
    <command>retroarch --config $HOME/.config/ES-DE/retroarch.cfg -L $HOME/.config/retroarch/cores/bsnes_libretro.so %ROM%</command>
    <platform>snes</platform>
    <theme>snes</theme>
</system>
```

---

## 🎮 RetroArch Configuration

File:

```bash
~/.config/ES-DE/retroarch.cfg
```

Recommended setup:

* Vulkan enabled
* Fullscreen enabled
* Overlays disabled
* Shaders optional

---

## 🎨 Shaders (Optional)

```ini
video_shader_enable = "true"
video_shader = "~/.config/retroarch/shaders/shaders_slang/crt/crt-guest-advanced.slangp"
```

> Note: `crt-royale` is performance intensive.

---

## 🔄 Arcade Rotation

For vertical games:

1. Launch game
2. Press `F1`
3. Adjust rotation
4. Save override

---

## ⚠️ Common Issues

### No systems loaded

* Invalid `<path>`
* Incorrect ROM directory

---

### Games not showing

* Folder mismatch
* Missing extensions

---

### Black screen

* Wrong core
* Shader issues

---

### Broken gamelist

```bash
rm ~/.config/ES-DE/gamelists/*/gamelist.xml
```

---

## 🧠 Philosophy

* One frontend → ES-DE
* One backend → RetroArch
* Minimal configuration

---

## 🏁 Result

A setup that is:

* Clean
* Predictable
* Easy to maintain
* Ready for version control

---

## 🔥 Future Improvements

* Per-system shader presets
* Automated setup script
* Additional system support

---
