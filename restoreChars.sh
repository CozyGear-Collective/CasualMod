#!/bin/bash
# Restore Valheim character files

BACKUP_ROOT="$HOME/valheim_backups"
TARGET_DIR="$HOME/.config/unity3d/IronGate/Valheim/characters"

# Default to "latest" if no argument given
BACKUP_DIR="${1:-$BACKUP_ROOT/latest}"

# Check if backup directory exists
if [ ! -d "$BACKUP_DIR" ]; then
  echo "Backup directory not found: $BACKUP_DIR"
  exit 1
fi

# Confirm before restoring
read -p "This will overwrite your current characters with backup from '$BACKUP_DIR'. Are you sure? (yes/no) " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
  echo "Restore cancelled."
  exit 1
fi

# Copy files back
cp -v "$BACKUP_DIR"/* "$TARGET_DIR/"

echo "Restore complete from $BACKUP_DIR."
