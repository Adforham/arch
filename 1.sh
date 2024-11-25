#!/bin/sh
mkfs.ext4 /dev/sda3
mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
mount /dev/sda3 /mnt
mount --mkdir /dev/sda1 /mnt/boot
swapon /dev/sda2
reflector
pacstrap -K /mnt base linux linux-firmware intel-ucode sof-firmware networkmanager nano
genfstab -U /mnt >> /mnt/etc/fstab
