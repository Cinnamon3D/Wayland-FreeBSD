#!/bin/bash

#_____________________________________________________________________________

echo "Installing wayland and needed packages..."
sudo pkg install wayland seatd socket wlroots drm-510-kmod elogind

echo "Enabling Services..."
export XDG_RUNTIME_DIR=/var/run/user/`id -u`
echo "export XDG_RUNTIME_DIR=/var/run/user/`id -u`" >> ~/.shrc
sudo service elogind start
sudo sysrc elogind_enable="YES"
#echo "sudo service elogind start" >> ~/.shrc
sudo pw groupmod video -m cinnamon
sudo echo "kld_list="drm-510-kmod"" >> /etc/rc.conf

#_____________________________________________________________________________

echo "Would you like to install optional packages? (yes/no)"
read response

if [[ "$response" == "yes" ]]; then
    echo "Installing optional packages..."
    sudo pkg install py39-ranger btop neofetch micro
elif [[ "$response" == "no" ]]; then
    echo "Okay, skipping..."
else
    echo "Invalid response. Please enter 'yes' or 'no'"
fi

#_____________________________________________________________________________

echo "Would you like to install other tools? (yes/no)"
read response

if [[ "$response" == "yes" ]]; then
    echo "Installing optional packages..."
    sudo pkg install python
elif [[ "$response" == "no" ]]; then
    echo "Okay, skipping..."
else
    echo "Invalid response. Please enter 'yes' or 'no'"
fi

#_____________________________________________________________________________

#Still need to add all packages to install, UI configs, and Wifi drivers, to the script

sudo sysrc kld_list+=i915kms

sudo sysrc dbus_enable="YES"

sudo pw groupmod video -m cinnamon
