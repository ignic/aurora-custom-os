#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Install Monokle app
mkdir -p /usr/share/monokle
curl -L https://github.com/kubeshop/monokle/releases/download/downloads/Monokle-linux-x86_64.AppImage -o /usr/share/monokle/monokle
chmod 0755 /usr/share/monokle/monokle

# Fix fastfetch config for some terminals (e.g. kitty)
mv /usr/share/ublue-os/ublue-os.jsonc /tmp/ublue-os.jsonc
jq '.display.color.keys = "blue" | .modules[0].color.user = "blue"' /tmp/ublue-os.jsonc > /usr/share/ublue-os/ublue-os.jsonc
rm -f /tmp/ublue-os.jsonc
