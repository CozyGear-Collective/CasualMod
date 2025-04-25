#!/bin/bash

set -e

ZIP_NAME="BepInExPack_Valheim.zip"
TEMP_DIR="temp_unpack"
DOWNLOAD_URL="https://thunderstore.io/package/download/denikson/BepInExPack_Valheim/5.4.2202/"

echo "Downloading BepInExPack for Valheim..."
curl -L -o "$ZIP_NAME" "$DOWNLOAD_URL"

echo "Unzipping to temp directory..."
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"
unzip -o "$ZIP_NAME" -d "$TEMP_DIR"

echo "Moving contents to current directory (overwriting)..."
shopt -s dotglob
cp -rf "$TEMP_DIR"/*/* . || true
shopt -u dotglob

echo "Cleaning up..."
rm -rf "$ZIP_NAME" "$TEMP_DIR"

echo "Making shell scripts executable..."
find . -name "*.sh" -exec chmod +x {} \;

echo "Setup complete."
