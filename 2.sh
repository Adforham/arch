#!/bin/sh
ln -sf /usr/share/zoneinfo/Africa/Cairo /etc/localtime
hwclock --systohc
rm /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "arch" >> /etc/hostname
bootctl install
rm /boot/loader/loader.conf
echo "default arch.conf" >> /boot/loader/loader.conf
echo "timeout 0" >> /boot/loader/loader.conf
echo "console-mode max" >> /boot/loader/loader.conf
echo "editor no" >> /boot/loader/loader.conf
echo "title arch" >> /boot/loader/entries/arch.conf
echo "linux /vmlinuz-linux" >> /boot/loader/entries/arch.conf
echo "initrd /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options root=/dev/nvme0n1p2 rw" >> /boot/loader/entries/arch.conf
pacman -S --noconfirm base-devel git --needed
systemctl enable NetworkManager
useradd -m ham
echo "ham" | passwd ham --stdin
echo "ham" | passwd --stdin
