#!/bin/bash

# Define variables
SCRIPT_DIR="/home/ubuntu/ubuntu-tools"
UPDATE_SCRIPT="$SCRIPT_DIR/update-packages.sh"
PATCH_SCRIPT="$SCRIPT_DIR/apply_patches.sh"
CRON_UPDATE_SCHEDULE="0 0 * * *"
CRON_PATCH_SCHEDULE="0 0 */15 * *"

# Create the update-packages.sh script
echo -e "#!/bin/bash\nsudo apt update" > "$UPDATE_SCRIPT"
chmod +x "$UPDATE_SCRIPT"

# Add a cron job to run the update script every day
(crontab -l 2>/dev/null; echo "$CRON_UPDATE_SCHEDULE $UPDATE_SCRIPT") | crontab -

# Create the apply_patches.sh script
echo -e "#!/bin/bash\nsudo apt update\nsudo apt upgrade -y\nsudo apt autoremove -y\nsudo reboot" > "$PATCH_SCRIPT"
chmod +x "$PATCH_SCRIPT"

# Add a cron job to run the apply_patches.sh script every 15 days
(crontab -l 2>/dev/null; echo "$CRON_PATCH_SCHEDULE $PATCH_SCRIPT") | crontab -
