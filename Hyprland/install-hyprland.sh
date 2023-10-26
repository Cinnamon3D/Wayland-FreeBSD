#!/bin/sh

echo "Installing wayland and needed packages..."
sudo pkg install hyprland wayland firefox seatd socket wlroots drm-510-kmod drm-kmod elogind nwg-look swaybg 
sudo pkg install python py39-ranger btop neofetch micro

echo "Enabling Services..."
export XDG_RUNTIME_DIR=/var/run/user/`id -u`
echo "export XDG_RUNTIME_DIR=/var/run/user/`id -u`" >> ~/.shrc
sudo service elogind start
sudo sysrc elogind_enable="YES"
#echo "sudo service elogind start" >> ~/.shrc
sudo pw groupmod video -m cinnamon
sudo echo "kld_list="drm-510-kmod"" >> /etc/rc.conf

sudo sysrc kld_list+=i915kms

sudo sysrc dbus_enable="YES"

sudo pw groupmod video -m cinnamon

mv hyprland.conf /$HOME/.config/hypr/
mv Wallpaper.jpg /$HOME/.config/hypr/
mv kitty.conf /$HOME/.config/kitty
mv dunstrc /$HOME/.config/dunst

#Still need to add all packages to install, UI configs, Wifi drivers, and bluetooth, to the script
