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

# # Build driver for Fibocom L850-GL / Intel XMM7360 (PCI ID 8086:7360)
# # https://github.com/xmm7360/xmm7360-pci
# # https://github.com/xmm7360/xmm7360-pci/issues/222
# dnf install -y python3-pyroute2 python3-configargparse automake kernel-devel
# XMM7360=/usr/share/xmm7360-pci
# git clone https://github.com/xmm7360/xmm7360-pci $XMM7360
# git -C $XMM7360 config user.name "admin"
# git -C $XMM7360 config user.email "admin@admin.com"
# git -C $XMM7360 remote add mfournier https://github.com/mfournier/xmm7360-pci
# git -C $XMM7360 remote add bill88t https://github.com/bill88t/xmm7360-pci
# git -C $XMM7360 fetch --all --prune
# git -C $XMM7360 checkout -b develop
# git -C $XMM7360 merge --no-edit mfournier/linux-6.6
# git -C $XMM7360 merge --no-edit bill88t/master
# make -C $XMM7360
# make -C $XMM7360 install
# ln -s $XMM7360/scripts/lte.sh /usr/bin/xmm7360
# dnf remove -y automake kernel-devel
