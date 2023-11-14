#!/bin/bash

ZIP_URL="https://github.com/RedHatOfficial/Overpass/releases/download/3.0.2/overpass-desktop-fonts.zip"
TEMP_DIR="./tmp_fonts"
mkdir -p "$TEMP_DIR"

curl -L -o "$TEMP_DIR/overpass-fonts.zip" "$ZIP_URL"
unzip "$TEMP_DIR/overpass-fonts.zip" -d "$TEMP_DIR"

sudo cp -r "$TEMP_DIR"/* /usr/share/fonts/

rm -rfI "$TEMP_DIR"
