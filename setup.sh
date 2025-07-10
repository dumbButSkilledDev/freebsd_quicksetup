#!/bin/sh

echo "[INFO] downloading xorg..."
pkg install xorg

echo "[INFO] graphical driver setup"
echo "[INFO] type the graphical driver package name"
echo "[INFO] use drm-kmod for a intel or amd gpu"
echo "[INFO] use nvidia-driver for a nvidia gpu"
echo "[INFO] use virtualbox-ose-additions if your using virtualbox"
echo "[INFO] use xf86-video-vmware if your using vmware"
read gdriver

echo "[INFO] driver selected: $gdriver"
echo "[INFO] downloading: $gdriver"
pkg install $gdriver

echo "[INFO] downloading kde...."
pkg install kde

echo "[INFO] configuring KDE...."
echo "[INFO] enabling dbus..."
sysrc dbus_enable="YES"

echo "[INFO] downloading sddm...."
pkg install sddm

echo "[INFO] configuring sddm...."
sysrc sddm_enable="YES"

echo "[INFO] configuring startx to work for kde (root only)...."
echo "exec dbus-launch --exit-with-x11 ck-launch-session startplasma-x11" > ~/.xinitrc

echo "[INFO] configuring linux compat layer...."
service linux start

echo "[INFO] choose a linux userland."
echo "[INFO] type linux_base-r19 for rocky linux 9"
echo "[INFO] type linux_base-c7 for cent os 7"
echo "[INFO] if you want to use debian/ubuntu please install one of the following above then follow the linux binary compat documentation page."
read luserland

pkg install $luserland

echo "[INFO] installation complete."
echo "[INFO] created by dumbbutskilleddev on github"
