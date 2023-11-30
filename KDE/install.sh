#!/bin/sh

sudo pkg install plasma5-plasma konsole firefox drm-kmod sddm kate dolphin python py39-ranger btop neofetch micro calcurse wifimgr
sudo pkg remove plasma5-discover

sudo pw groupmod video -m cinnamon

sudo sysrc kld_list+=i915kms

sudo sysrc dbus_enable="YES"

sudo sysrc sddm_enable="YES"

sudo sysrc sddm_lang="en_ES"

echo "exec ck-launch-session startplasma-x11" > ~/.xinitrc
