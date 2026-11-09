# Backup, Security & Presentation
#!/bin/bash
mkdir -p backups
pg_dump -Fc -f backups/capstone_$(date +%F).dump capstone
echo "Backup completed successfully."