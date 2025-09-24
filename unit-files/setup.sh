#! /usr/bin/env sh

set -e

# Get script directory and resolve paths
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TIMER_FILE="$SCRIPT_DIR/sci-tally.timer"
KUBE_FILE="$SCRIPT_DIR/sci-tally.kube"

# Check that source files exist
if [ ! -f "$TIMER_FILE" ]; then
    echo "Error: sci-tally.timer not found in $SCRIPT_DIR"
    exit 1
fi

if [ ! -f "$KUBE_FILE" ]; then
    echo "Error: sci-tally.kube not found in $SCRIPT_DIR"
    exit 1
fi

# Create directories
mkdir -p "$HOME/.config/systemd/user/"
mkdir -p "$HOME/.config/containers/systemd/"

# Create symlinks (force overwrite if they exist)
ln -sf "$TIMER_FILE" "$HOME/.config/systemd/user/sci-tally.timer"
ln -sf "$KUBE_FILE" "$HOME/.config/containers/systemd/sci-tally.kube"

# Check for systemctl and reload/enable services
if command -v systemctl > /dev/null 2>&1; then
    systemctl --user daemon-reload
    systemctl --user enable sci-tally.service
    systemctl --user enable sci-tally.timer
    systemctl --user restart sci-tally.timer
    echo "Services enabled and timer started"
else
    echo "No systemctl detected - services not enabled"
fi
