#!/bin/sh

echo "Installing wayland and needed packages..."
sudo pkg install hyprland wayland xdg-desktop-portal-hyprland wofi kitty firefox nwg-look swaybg 
sudo pkg install python py39-ranger btop neofetch micro calcurse wifimgr
sudo pkg install wlsunset mako kanshi wlogout swayidle seatd socket wlroots drm-510-kmod drm-kmod

echo "Enabling Services..."
export XDG_RUNTIME_DIR=/tmp
echo "export XDG_RUNTIME_DIR=/tmp" >> ~/.shrc
#echo "sudo service seatd onestart" >> ~/.shrc
echo "sudo service seatd onestart" >> /etc/rc.local
sudo pw groupmod video -m cinnamon
sudo echo "kld_list="drm-510-kmod"" >> /etc/rc.conf

sudo sysrc kld_list+=i915kms

sudo kldload i915kms

sudo sysrc dbus_enable="YES"

sudo pw groupmod video -m cinnamon

mkdir -p "$HOME/.config/hypr"
mv "hyprland.conf" "/$HOME/.config/hypr/"
mv "Wallpaper.jpg" "/$HOME/.config/hypr/"
mkdir -p "$HOME/.config/kitty"
mv "kitty.conf" "/$HOME/.config/kitty"
mkdir -p "$HOME/.config/dunst"
mv "dunstrc" "/$HOME/.config/dunst"

#Still need to add all packages to install, UI configs, polkit, Wifi drivers, network selector, and bluetooth, to the script
