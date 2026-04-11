#!/bin/bash

CONFIG_HOME="$HOME/.config/"

APPIMAGE="./ES-DE_x64.AppImage"

# 1. Se AppImage existir localmente
if [ -f "$APPIMAGE" ]; then
    echo "Rodando ES-DE via AppImage..."
    chmod +x "$APPIMAGE"
    "$APPIMAGE" --home "$CONFIG_HOME"
    exit 0
fi

# 2. Procurar pacote instalado no sistema
if command -v es-de &> /dev/null; then
    echo "Rodando ES-DE via pacote (es-de)..."
    es-de --home "$CONFIG_HOME"
    exit 0
fi

if command -v emulationstation &> /dev/null; then
    echo "Rodando EmulationStation..."
    emulationstation --home "$CONFIG_HOME"
    exit 0
fi

# 3. Nada encontrado
echo "Nenhum ES-DE instalado (AppImage, es-de ou emulationstation)."
exit 1
