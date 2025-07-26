#!/bin/bash

# Remove all installed snap packages from Ubuntu

# List all installed snaps except "core", "snapd", and "bare" (which may be needed for system functionality)
snaps=$(snap list | awk 'NR>1 {print $1}' | grep -vE '^(core|snapd|bare)$')

for snap in $snaps; do
    echo "Removing snap: $snap"
    snap remove --purge "$snap"
done

# Optionally remove core system snaps if you are sure you don't need snap anymore
# Uncomment below lines if you want to remove these as well (not recommended for most users)
# snap remove --purge core
# snap remove --purge snapd
# snap remove --purge bare

# Remove snap cache and directories
sudo rm -rf ~/snap
sudo rm -rf /var/cache/snapd/
sudo rm -rf /var/snap/
sudo rm -rf /snap/

echo "All user snaps removed. Snap system files remain unless you uncomment the core removal lines."
echo "Trash removed from ubuntu :D have a nice day!"
