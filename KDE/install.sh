#!/bin/sh

echo "Installing wayland and needed packages..."
sudo pkg install plasma5-plasma firefox drm-kmod kate dolphin python py39-ranger btop neofetch micro calcurse wifimgr

sudo pw groupmod video -m cinnamon

sudo sysrc kld_list+=i915kms

sudo sysrc dbus_enable="YES"
