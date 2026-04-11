# 🎮 ES-DE + RetroArch (Linux / Arch) Setup

![ES-DE](es-de.jpg)

![RetroArch](retroarch.png)

A clean and minimal setup for ES-DE using RetroArch (libretro cores only), focused on stability, organization, and ease of maintenance.

---

## 🚀 Purpose

* Run all systems through RetroArch
* Use an isolated configuration (`retroarch.cfg`)
* Avoid conflicts with overlays and shaders
* Keep everything organized inside `.config`
* Maintain a simple and predictable setup

---

## ⚙️ Running ES-DE

This setup uses the AppImage version of ES-DE to allow full control over the configuration directory.

### Using AppImage

```bash
./ES-DE_x64.AppImage --home ~/.config/
```

---

### Why use `--home`?

By default, ES-DE stores data in multiple locations inside the user’s home directory. This can quickly become disorganized.

Using:

```bash
--home ~/.config/
```

forces ES-DE to:

* Store all configuration files in a single location
* Keep gamelists, systems, and metadata isolated
* Avoid polluting the default `$HOME` directory
* Make backups and version control easier

Result: a clean and portable setup.

---

### Using an Installed Version

If ES-DE is installed via a package manager:

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

## 📁 ROMs and Cores (Important)

This setup assumes that both ROMs and cores follow the standard RetroArch structure.

### ROMs

All ROMs must be placed inside:

```bash
~/.config/retroarch/roms/
```

And organized by system, for example:

```bash
Nintendo - Super Nintendo Entertainment System/
Nintendo - Nintendo Entertainment System/
Sony - PlayStation/
```

The folder names must match the paths defined in `es_systems.xml`.

---

### Cores

All cores must be located in:

```bash
~/.config/retroarch/cores/
```

Example:

```bash
bsnes_libretro.so
mesen_libretro.so
parallel_n64_libretro.so
```

---

### Important Notes

* ES-DE does not manage cores
* RetroArch must already be configured and working
* Paths in `es_systems.xml` must match actual folders exactly

---

## 🎯 ROM Directory Configuration

File:

```bash
~/.config/ES-DE/es_settings.xml
```

Set:

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

* Vulkan enabled
* Fullscreen enabled
* Overlays disabled
* Shaders optional

---

## ⚠️ Common Issues

### "0 systems loaded"

* Invalid `<path>`
* Incorrect ROM directory

---

### Games not appearing

* Folder name mismatch
* Unsupported file extensions

---

### Black screen

* Incorrect core
* Shader issues
* Broken configuration

---

### Broken gamelist

```bash
rm ~/.config/ES-DE/gamelists/*/gamelist.xml
```

---

## 🧠 Philosophy

* One frontend (ES-DE)
* One backend (RetroArch)
* Clean and maintainable setup

---

## 🏁 Result

A setup that is:

* Organized
* Predictable
* Easy to maintain
* Ready for version control

---
