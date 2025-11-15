#!/bin/bash

echo "=== Uninstalling KDE Auto Rotate ==="

SERVICE_PATH="$HOME/.config/systemd/user/auto-rotate.service"
SCRIPT_PATH="/usr/local/bin/auto_rotate.sh"

echo "[1/4] Stopping service ..."
systemctl --user stop auto-rotate.service >/dev/null 2>&1

echo "[2/4] Disabling service ..."
systemctl --user disable auto-rotate.service >/dev/null 2>&1

echo "[3/4] Removing service file ..."
if [ -f "$SERVICE_PATH" ]; then
    rm "$SERVICE_PATH"
    echo "Removed: $SERVICE_PATH"
else
    echo "No service file found at: $SERVICE_PATH"
fi

echo "[4/4] Removing script ..."
if [ -f "$SCRIPT_PATH" ]; then
    sudo rm "$SCRIPT_PATH"
    echo "Removed: $SCRIPT_PATH"
else
    echo "No script found at: $SCRIPT_PATH"
fi

echo "Reloading systemd user daemon ..."
systemctl --user daemon-reload

echo ""
echo "=== Uninstall complete ==="
echo ""
echo "Tip: If you re-install later, run: ./install.sh"
