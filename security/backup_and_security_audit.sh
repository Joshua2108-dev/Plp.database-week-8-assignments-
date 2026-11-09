#!/bin/bash
# Stop script on any error
set -e

BACKUP_DIR="backups"
mkdir -p "$BACKUP_DIR"
TIMESTAMP=$(date +%F_%T)
BACKUP_FILE="$BACKUP_DIR/capstone_$TIMESTAMP.dump"

echo "Starting custom-format database backup..."
pg_dump -Fc -f "$BACKUP_FILE" capstone
echo "Backup successfully written to $BACKUP_FILE"

# Test restore verification step
echo "Verifying backup integrity with test dry-run..."
pg_restore --list "$BACKUP_FILE" > /dev/null && echo "Backup integrity verified successfully!"