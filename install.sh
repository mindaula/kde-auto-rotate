#!/bin/bash

set -e

SERVICE_DIR="$HOME/.config/systemd/user"
SCRIPT_PATH="/usr/local/bin/auto_rotate.sh"
SERVICE_PATH="$SERVICE_DIR/auto-rotate.service"

echo "=== Installing KDE Auto Rotate ==="


echo "[1/4] Installing auto_rotate.sh to /usr/local/bin/ ..."
sudo cp auto_rotate.sh "$SCRIPT_PATH"
sudo chmod +x "$SCRIPT_PATH"


echo "[2/4] Creating systemd user service ..."

mkdir -p "$SERVICE_DIR"

cat > "$SERVICE_PATH" <<EOF
[Unit]
Description=Auto Screen Rotation (Wayland + monitor-sensor)
After=graphical-session.target

[Service]
ExecStart=$SCRIPT_PATH
Restart=always
RestartSec=1

Environment=DISPLAY=:0
Environment=XDG_SESSION_TYPE=wayland
Environment=DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/%U/bus

[Install]
WantedBy=default.target
EOF


echo "[3/4] Reloading systemd user daemon ..."
systemctl --user daemon-reload

echo "[4/4] Enabling and starting service ..."
systemctl --user enable --now auto-rotate.service

echo
echo "=== Installation Complete ==="
echo "Service status:"
systemctl --user status auto-rotate.service --no-pager
echo
echo "To view live rotation logs:"
echo "   journalctl --user -fu auto-rotate.service"
