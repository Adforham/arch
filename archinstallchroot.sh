#!/bin/sh
ln -sf /usr/share/zoneinfo/Africa/Cairo /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "waifu" >> /etc/hostname
mkinitcpio -P
fastfetch
