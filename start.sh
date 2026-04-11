#!/bin/bash

CONFIG_HOME="$HOME/.config/"
APPIMAGE="./ES-DE_x64.AppImage"

# 1. Check local AppImage
if [ -f "$APPIMAGE" ]; then
    echo "Running ES-DE via AppImage..."
    chmod +x "$APPIMAGE"
    "$APPIMAGE" --home "$CONFIG_HOME"
    exit 0
fi

# 2. Check installed packages (Arch)
if command -v es-de &> /dev/null; then
    echo "Running ES-DE via system package (es-de)..."
    es-de --home "$CONFIG_HOME"
    exit 0
fi

if command -v emulationstation &> /dev/null; then
    echo "Running EmulationStation via system package..."
    emulationstation --home "$CONFIG_HOME"
    exit 0
fi

# 3. Nothing found
echo "No ES-DE installation found (AppImage, es-de, or emulationstation)."
exit 1
