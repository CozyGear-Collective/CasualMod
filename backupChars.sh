#!/bin/bash
# Backup Valheim character files with "latest" link

SOURCE_DIR="$HOME/.config/unity3d/IronGate/Valheim/characters"
BACKUP_ROOT="$HOME/valheim_backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="$BACKUP_ROOT/characters_backup_$TIMESTAMP"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Copy character files
cp -v "$SOURCE_DIR"/* "$BACKUP_DIR/"

# Update "latest" symlink
ln -sfn "$BACKUP_DIR" "$BACKUP_ROOT/latest"

echo "Backup complete: $BACKUP_DIR (latest -> $BACKUP_DIR)"
